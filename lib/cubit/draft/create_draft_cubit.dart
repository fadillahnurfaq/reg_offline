import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:register_offline/models/member/create_member_parameter.dart';
import 'package:register_offline/services/member_service.dart';
import 'package:register_offline/utils/validator/validator_result.dart';

part 'create_draft_state.dart';
part 'create_draft_cubit.freezed.dart';

class CreateDraftCubit extends Cubit<CreateDraftState> {
  final MemberService memberService;
  CreateDraftCubit({
    required this.memberService,
  }) : super(CreateDraftState.initial());

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nikController = TextEditingController();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();

  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  final List<String> genderOptions = ["Laki-laki", "Perempuan"];
  final List<String> statusOptions = ["Belum Menikah", "Menikah", "Duda", "Janda"];
  final List<String> occupationOptions = ["PNS", "Swasta", "Wiraswasta", "Lainnya"];
  final List<String> provinceOptions = ["Jawa Barat", "Jawa Tengah", "Jawa Timur"];
  final List<String> cityOptions = ["Bandung", "Semarang", "Surabaya"];
  final List<String> districtOptions = ["Coblong", "Gajahmungkur", "Wonokromo"];
  final List<String> subDistrictOptions = ["Dago", "Candisari", "Genteng"];

  @override
  Future<void> close() {
    phoneNumberController.dispose();
    nikController.dispose();
    fullNameController.dispose();
    placeOfBirthController.dispose();
    addressController.dispose();
    postalCodeController.dispose();
    return super.close();
  }


  void validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      emit(state.copyWith(
        phoneNumberValidation: FailedValidationResult("Nomor telepon tidak boleh kosong")
      ));
    }

    if (phoneNumber.isNotEmpty && !RegExp(r'(^(?:[+0]9)?[0-9]{9,12}$)').hasMatch(phoneNumber)) {
      emit(state.copyWith(
        phoneNumberValidation: FailedValidationResult("Nomor telepon tidak valid")
      ));
    } else {
      emit(state.copyWith(
        phoneNumberValidation: SuccessValidationResult()
      ));
    }
  }

  void validateNik(String nik) {
    if (nik.isEmpty) {
      emit(state.copyWith(
        nikValidation: FailedValidationResult("NIK tidak boleh kosong")
      ));
    }

    if (nik.isNotEmpty && !RegExp(r'^[0-9]{16}$').hasMatch(nik)) {
      emit(state.copyWith(
        nikValidation: FailedValidationResult("NIK tidak valid")
      ));
    } else {
      emit(state.copyWith(
        nikValidation: SuccessValidationResult()
      ));
    }
  }

  void setPrimaryIdentityPhoto(File photo) {
    emit(state.copyWith(primaryIndentityPhoto: photo));
  }

  void setSecondaryIdentityPhoto(File photo) {
    emit(state.copyWith(secondaryIndentityPhoto: photo));
  }

  void setDateOfBirth(DateTime dateOfBirth) {
    emit(state.copyWith(dateOfBirth: dateOfBirth));
  }

  void setGender(String? gender) {
    emit(state.copyWith(gender: gender));
  }

  void setStatus(String? status) {
    emit(state.copyWith(status: status));
  }

  void setOccupation(String? occupation) {
    emit(state.copyWith(occupation: occupation));
  }

  void setProvince(String? province) {
    emit(state.copyWith(province: province));
  }

  void setCity(String? city) {
    emit(state.copyWith(city: city));
  }

  void setDistrict(String? district) {
    emit(state.copyWith(district: district));
  }

  void setSubDistrict(String? subDistrict) {
    emit(state.copyWith(subDistrict: subDistrict));
  }

  bool get isEligibleToSubmit {
    return state.phoneNumberValidation is SuccessValidationResult 
      && state.nikValidation is SuccessValidationResult 
      && state.primaryIndentityPhoto != null 
      && state.secondaryIndentityPhoto != null;
  }

  Future<void> upload() async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null, isSuccess: null));
    final parameter = CreateMemberParameter(
      name: fullNameController.text.trim(),
      nik: nikController.text.trim(),
      phone: phoneNumberController.text.trim(),
      primaryIdentityPhoto: state.primaryIndentityPhoto,
      secondaryIdentityPhoto: state.secondaryIndentityPhoto,
      birthPlace: placeOfBirthController.text.trim(),
      birthDate: state.dateOfBirth,
      status: state.status,
      occupation: state.occupation,
      address: addressController.text.trim(),
      province: state.province,
      city: state.city,
      district: state.district,
      subDistrict: state.subDistrict,
      postalCode: postalCodeController.text.trim(),
    );
    final result = await memberService.create(parameter: parameter);
    result.fold((failure) {
      emit(state.copyWith(isSubmitting: false, errorMessage: failure.message, isSuccess: false));
    }, (success) {
      emit(state.copyWith(isSubmitting: false, isSuccess: true, errorMessage: null));
    });
  }
}
