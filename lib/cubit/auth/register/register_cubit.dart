import 'package:flutter/material.dart';
import 'package:register_offline/utils/validator/validator_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  bool get isValid => state.emailValidation is SuccessValidationResult && state.passwordValidation is SuccessValidationResult;
}