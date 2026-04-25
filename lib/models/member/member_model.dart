import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';
import 'package:register_offline/utils/dio_service/dio_service_response.dart';
import 'package:register_offline/utils/model_parser.dart';
import '../../utils/colors.dart';
import 'create_member_parameter.dart';

part 'member_model.g.dart';

@HiveType(typeId: 1)
enum MemberSyncType {
  @HiveField(0)
  draft(
    label: "Draft",
    textColor: AppColors.warning600,
    backgroundColor: AppColors.warning200
  ), 

  @HiveField(1)
  uploaded(
    label: "Di-upload",
    textColor: AppColors.green600,
    backgroundColor: AppColors.green200
  );

  final String label;
  final Color textColor;
  final Color backgroundColor;

  const MemberSyncType({
    required this.label,
    required this.textColor,
    required this.backgroundColor
  });

  bool get isDraft => this == MemberSyncType.draft;

  bool get isUploaded => this == MemberSyncType.uploaded;

}

@HiveType(typeId: 0)
class MemberModel extends HiveObject with DioServiceResponse<MemberModel> {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String nik;

  @HiveField(4)
  final String phoneNumber;

  @HiveField(5)
  final String primaryIdentityPhotoUrl; 

  @HiveField(6)
  final String secondaryIdentityPhotoUrl; 

  @HiveField(7)
  final String? birthPlace;

  @HiveField(8)
  final DateTime? birthDate;

  @HiveField(9)
  final String? gender;

  @HiveField(10)
  final String? status;

  @HiveField(11)
  final String? occupation;

  @HiveField(12)
  final String? province;

  @HiveField(13)
  final String? city;

  @HiveField(14)
  final String? district;

  @HiveField(15)
  final String? subDistrict;

  @HiveField(16)
  final String? postalCode;

  @HiveField(17)
  final String? address;

  @HiveField(18)
  final String? primaryIndentityPhotoPath;

  @HiveField(19)
  final String? secondaryIndentityPhotoPath;

  @HiveField(20)
  final MemberSyncType syncType;

  MemberModel({
    this.id = 0,
    this.userId = '',
    this.fullName = '',
    this.nik = '',
    this.phoneNumber = '',
    this.primaryIdentityPhotoUrl = '',
    this.secondaryIdentityPhotoUrl = '',
    this.birthPlace,
    this.birthDate,
    this.gender,
    this.status,
    this.occupation,
    this.province,
    this.city,
    this.district,
    this.subDistrict,
    this.postalCode,
    this.address,
    this.primaryIndentityPhotoPath,
    this.secondaryIndentityPhotoPath,
    this.syncType = MemberSyncType.draft,
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
      syncType: MemberSyncType.uploaded
    );
  }

  MemberModel copyWith({
    int? id,
    String? userId,
    String? fullName,
    String? nik,
    String? phoneNumber,
    String? primaryIdentityPhotoUrl,
    String? secondaryIdentityPhotoUrl,
    String? birthPlace,
    DateTime? birthDate,
    String? gender,
    String? status,
    String? occupation,
    String? province,
    String? city,
    String? district,
    String? subDistrict,
    String? postalCode,
    String? address,
    String? primaryIndentityPhotoPath,
    String? secondaryIndentityPhotoPath,
    MemberSyncType? syncType
  }) {
    return MemberModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      nik: nik ?? this.nik,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      primaryIdentityPhotoUrl: primaryIdentityPhotoUrl ?? this.primaryIdentityPhotoUrl,
      secondaryIdentityPhotoUrl: secondaryIdentityPhotoUrl ?? this.secondaryIdentityPhotoUrl,
      birthPlace: birthPlace ?? this.birthPlace,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      occupation: occupation ?? this.occupation,
      province: province ?? this.province,
      city: city ?? this.city,
      district: district ?? this.district,
      subDistrict: subDistrict ?? this.subDistrict,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
      primaryIndentityPhotoPath: primaryIndentityPhotoPath ?? this.primaryIndentityPhotoPath,
      secondaryIndentityPhotoPath: secondaryIndentityPhotoPath ?? this.secondaryIndentityPhotoPath,
      syncType: syncType ?? this.syncType
    );
  }

  MemberModel asNewObject() {
    return MemberModel(
      id: id,
      userId: userId,
      fullName: fullName,
      nik: nik,
      phoneNumber: phoneNumber,
      primaryIdentityPhotoUrl: primaryIdentityPhotoUrl,
      secondaryIdentityPhotoUrl: secondaryIdentityPhotoUrl,
      birthPlace: birthPlace,
      birthDate: birthDate,
      gender: gender,
      status: status,
      occupation: occupation,
      province: province,
      city: city,
      district: district,
      subDistrict: subDistrict,
      postalCode: postalCode,
      address: address,
      primaryIndentityPhotoPath: primaryIndentityPhotoPath,
      secondaryIndentityPhotoPath: secondaryIndentityPhotoPath,
      syncType: syncType
    );
  }

  CreateMemberParameter toCreateParameter() {
    return CreateMemberParameter(
      name: fullName,
      nik: nik,
      phone: phoneNumber,
      primaryIdentityPhoto: primaryIndentityPhotoPath != null ? File(primaryIndentityPhotoPath!) : null,
      secondaryIdentityPhoto: secondaryIndentityPhotoPath != null ? File(secondaryIndentityPhotoPath!) : null,
      birthPlace: birthPlace,
      birthDate: birthDate,
      status: status,
      occupation: occupation,
      province: province,
      city: city,
      district: district,
      subDistrict: subDistrict,
      postalCode: postalCode,
      address: address,
      gender: gender
    );
  }
}