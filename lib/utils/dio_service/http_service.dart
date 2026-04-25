import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:register_offline/utils/secure_storage_manager.dart';
import '../../models/api_exception.dart';
import '../../models/response_model.dart';
import 'dio_service_request.dart';

enum MethodRequest { get, post, download }

class HttpService {
  const HttpService();

  Dio get _dio => Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
      ),
    );

  Future<Either<ApiException, T>> request<T>({
    required final DioServiceRequest request,
    T Function(Map<String,dynamic> data)? fromResponseMap,
    T Function(List? data)? fromResponseList,
    T Function(dynamic value)? fromResponseValue,
  }) async {
    try {
      T onMap(Response<dynamic> response) {
        if (fromResponseMap != null || fromResponseList != null || fromResponseValue != null) {
          if (response.data is Map<String, dynamic>) {
            return fromResponseMap!(response.data);
          }
          if (response.data is List) {
            return fromResponseList!(response.data);
          }
          return fromResponseValue!(response.data);
        }
        return response.data;
      }
      final String baseUrl = request.options?.baseUrl ?? "";
      final response = await _dio.request(
        "$baseUrl${request.getPath}",
        data: await request.dataJson,
        queryParameters: request.queryParam,
        options: await _checkOptions(request.getDioMethod.name, request.options),
      );
      return right(onMap(response));
    } on DioException catch (e) {
      return Left(_fromDioError(e));
    } catch (e) {
      return Left(
        ApiException(
          statusCode: null,
          message: "Terjadi kesalahan pada aplikasi, silakan coba lagi nanti.",
        ),
      );
    }
  }

  Future<Options> _checkOptions(String method, Options? options) async {
    options ??= Options();
    options.method = method;
    final token = await SecureStorageManager.instance.getToken();
    if (token?.isNotEmpty ?? false) {
      options.headers ??= {};
      options.headers!['Authorization'] = 'Bearer $token';
    }
    return options;
  }

  ApiException _fromDioError(DioException e)  {
    if (e.error is SocketException) {
      return ApiException(
        statusCode: e.response?.statusCode,
        message: "Anda tidak terhubung ke jaringan.",
      );
    }
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Koneksi ke server kehabisan waktu.",
        );

      case DioExceptionType.sendTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Waktu mengirim ke server kehabisan waktu.",
        );

      case DioExceptionType.receiveTimeout:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Waktu menerima data dari server kehabisan waktu.",
        );

      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          return ApiException(
            statusCode: e.response?.statusCode,
            message: "${e.response?.statusCode}. Data tidak ditemukan",
          );
        }
        if ((e.response?.data is String &&
                (e.response?.data as String).contains("DOCTYPE")) ==
            true) {
          return ApiException(
            statusCode: e.response?.statusCode,
            message: "${e.response?.statusCode}. Kesalahan internal server, silahkan coba lagi nanti.",
          );
        }
        if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
          final ResponseModel<dynamic> response = ResponseModel.fromJson(
            e.response?.data,
            (data) => [],
          );
          return ApiException(
            statusCode: e.response?.statusCode,
            message: response.message,
          );
        }
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "${e.response?.statusCode != null ? "${e.response?.statusCode}. " : ""}Kesalahan internal server, silahkan coba lagi.",
        );
      case DioExceptionType.cancel:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Permintaan ke server dibatalkan.",
        );

      case DioExceptionType.unknown:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan yang tidak terduga, silahkan coba lagi.",
        );

      case DioExceptionType.connectionError:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan internal server, silahkan coba lagi.",
        );

      default:
        return ApiException(
          statusCode: e.response?.statusCode,
          message: "Kesalahan yang tidak terduga, silahkan coba lagi.",
        );
    }
  }
}