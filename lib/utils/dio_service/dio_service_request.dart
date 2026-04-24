import 'package:dio/dio.dart';
import '../../env/env_config.dart';
import 'option_builder.dart';

mixin DioServiceRequest {

  Future<dynamic> get dataJson async => await toFormData() ?? () {
    if (toJsonList().isNotEmpty) {
      return toJsonList();
    }
    return toJson();
  } ();

  /// mapper function used for `query param` or `data` inside [Dio]
  Map<String,dynamic> toJson() {
    return {};
  }

  List toJsonList() {
    return [];
  }

  DioContentType get contentType => DioContentType.JSON;

  DioMethod get dioMethod;

  DioMethod? _dioMethod;

  set dioMethod(DioMethod method) {
    _dioMethod = method;
  }

  DioMethod get getDioMethod {
    if (_dioMethod != null) {
      return _dioMethod!;
    }
    return dioMethod;
  }

  String get path;

  OptionsBuilder? get options {
    switch (contentType) {
      case DioContentType.JSON:
        return OptionsBuilder.withBaseUrl(EnvConfig.instance.api);
      case DioContentType.FORM_DATA:
        return OptionsBuilder.multipartData(baseUrl: EnvConfig.instance.api);
    }
  }
  String _path = '';

  String get getPath {
    if (_path.isNotEmpty) {
      return _path;
    }
    return path;
  }

  set path(String val) {
    _path = val;
  }

  Map<String,dynamic>? get queryParam {
    final Map<String, dynamic> query = {};
    if(dioMethod == DioMethod.GET) {
      query.addAll(toJson());
    }
    return query;
  }


  Future<FormData>? toFormData() => null;
}

enum DioMethod {
  POST,
  GET,
  PUT,
  DELETE,
}

enum DioContentType {
  JSON,
  FORM_DATA,
}

extension DioContentTypeExt on DioContentType {
  bool get isJson => this == DioContentType.JSON;

  bool get isFormData => this == DioContentType.FORM_DATA;
}