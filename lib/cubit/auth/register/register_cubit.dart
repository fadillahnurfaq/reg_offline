import 'package:flutter/material.dart';
import 'package:register_offline/models/auth/register_parameter.dart';
import 'package:register_offline/services/auth_service.dart';
import 'package:register_offline/utils/validator/validator_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService authService;
  RegisterCubit({
    required this.authService,
  }) : super(RegisterState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }

  void validateEmail(String email) {
    if (email.isEmpty) {
      emit(state.copyWith(
        emailValidation: FailedValidationResult("Email tidak boleh kosong")
      ));
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      emit(state.copyWith(
        emailValidation: FailedValidationResult("Email tidak valid")
      ));
    } else {
      emit(state.copyWith(
        emailValidation: SuccessValidationResult()
      ));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(
        passwordValidation: FailedValidationResult("Password tidak boleh kosong")
      ));
    } else if (password.length < 6) {
      emit(state.copyWith(
        passwordValidation: FailedValidationResult("Password harus minimal 6 karakter")
      ));
    } else {
      emit(state.copyWith(
        passwordValidation: SuccessValidationResult()
      ));
    }
  }

  void validateFullName(String fullName) {
    if (fullName.isEmpty) {
      emit(state.copyWith(
        fullNameValidation: FailedValidationResult("Nama lengkap tidak boleh kosong")
      ));
    } else {
      emit(state.copyWith(
        fullNameValidation: SuccessValidationResult()
      ));
    }
  }

  void validatePhoneNumber(String phoneNumber) {
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

  Future<void> register() async {
    if (!isValid) return;
    emit(state.copyWith(isLoading: true));

    final parameter = RegisterParameter(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullName: fullNameController.text.trim(),
      phone: phoneNumberController.text.trim(),
    );
    final result = await authService.register(parameter: parameter);
    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message,
        ));
      },
      (success) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
        ));
      },
    );
  }

  bool get isValid {
    return state.emailValidation is SuccessValidationResult 
      && state.passwordValidation is SuccessValidationResult 
      && state.fullNameValidation is SuccessValidationResult
      && state.phoneNumberValidation is SuccessValidationResult || state.phoneNumberValidation is InitialValidationResult;
  }
}