import 'package:intl/intl.dart';
import 'package:register_offline/utils/dio_service/dio_service_response.dart';
import 'package:register_offline/utils/model_parser.dart';

class MemberModel with DioServiceResponse<MemberModel> {
  final int id;
  final String userId;
  final String fullName;
  final String nik;
  final String phoneNumber;
  final String primaryIdentityPhotoUrl; 
  final String secondaryIdentityPhotoUrl; 
  final String birthPlace;
  final DateTime? birthDate;
  final String gender;
  final String? status;
  final String? occupation;
  final String? province;
  final String? city;
  final String? district;
  final String? subDistrict;
  final String? postalCode;
  final String? address;

  const MemberModel({
    this.id = 0,
    this.userId = '',
    this.fullName = '',
    this.nik = '',
    this.phoneNumber = '',
    this.primaryIdentityPhotoUrl = '',
    this.secondaryIdentityPhotoUrl = '',
    this.birthPlace = '',
    this.birthDate,
    this.gender = '',
    this.status,
    this.occupation,
    this.province,
    this.city,
    this.district,
    this.subDistrict,
    this.postalCode,
    this.address,
  });

  @override
  MemberModel fromResponseMap(Map<String, dynamic> json) {
    return MemberModel(
      id: ModelParser.intFromJson(json['id']) ?? 0,
      userId: json['user_id'] ?? '',
      fullName: json['name'] ?? '',
      nik: json['nik'] ?? '',
      phoneNumber: json['phone'] ?? '',
      primaryIdentityPhotoUrl: json['ktp_url'] ?? '',
      secondaryIdentityPhotoUrl: json['ktp_url_secondary'] ?? '',
      birthPlace: json['birth_place'] ?? '',
      birthDate: DateFormat('yyyy-MM-dd').tryParse(json['birth_date'] ?? ""),
      address: json['address'] ?? '',
      gender: json['gender'] ?? '',
      status: json['status'] ?? '',
      occupation: json['occupation'] ?? '',
      province: json['provinsi'] ?? '',
      city: json['kota_kabupaten'] ?? '',
      district: json['kecamatan'] ?? '',
      subDistrict: json['kelurahan'] ?? '',
      postalCode: json['kode_pos'] ?? '',
    );
  }
}