import 'dart:io';
import 'package:dio/dio.dart';
import 'package:register_offline/utils/dio_service/dio_service_request.dart';
import 'package:register_offline/utils/extensions/datetime_extension.dart';
import 'package:register_offline/utils/global_func.dart';

class CreateMemberParameter with DioServiceRequest {
  final String name;
  final String nik;
  final String phone;
  final File? primaryIdentityPhoto;
  final File? secondaryIdentityPhoto;
  final String? birthPlace;
  final DateTime? birthDate;
  final String? status;
  final String? occupation;
  final String? address;
  final String? province;
  final String? city;
  final String? district;
  final String? subDistrict;
  final String? postalCode;

  CreateMemberParameter({
    this.name = "",
    this.nik = "",
    this.phone = "",
    this.primaryIdentityPhoto,
    this.secondaryIdentityPhoto,
    this.birthPlace,
    this.birthDate,
    this.status,
    this.occupation,
    this.address,
    this.province,
    this.city,
    this.district,
    this.subDistrict,
    this.postalCode,
  });

  @override
  DioMethod get dioMethod => DioMethod.POST;

  @override
  String get path => "/member";

  @override
  DioContentType get contentType => DioContentType.FORM_DATA;

  @override
  Future<FormData>? toFormData() async {
    return FormData.fromMap({
      "name": name,
      "nik": nik,
      "phone": phone,
      "ktp_file": primaryIdentityPhoto != null ? MultipartFile.fromFileSync(primaryIdentityPhoto!.path, filename: GlobalFunc.getFileName(primaryIdentityPhoto!.path)) : null,
      "ktp_file_secondary": secondaryIdentityPhoto != null ? MultipartFile.fromFileSync(secondaryIdentityPhoto!.path, filename: GlobalFunc.getFileName(secondaryIdentityPhoto!.path)) : null,
      "birth_place": birthPlace,
      "birth_date": birthDate.formatDate(pattern: "yyyy-MM-dd"),
      "status": status,
      "occupation": occupation,
      "address": address,
      "provinsi": province,
      "kota_kabupaten": city,
      "kecamatan": district,
      "kelurahan": subDistrict,
      "kode_pos": postalCode,
    });
  }
}