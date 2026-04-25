import 'package:flutter/material.dart';
import 'package:register_offline/models/auth/login_parameter.dart';
import 'package:register_offline/services/auth_service.dart';
import 'package:register_offline/utils/secure_storage_manager.dart';
import 'package:register_offline/utils/validator/validator_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit({
    required this.authService,
  }) : super(LoginState.initial());

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

  Future<void> register() async {
    if (!isValid) return;
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: null));

    final parameter = LoginParameter(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    final result = await authService.login(parameter: parameter);
    await result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message,
        ));
      },
      (success) async {
        await SecureStorageManager.instance.write(
          key: BaseSecureStorageManager.KEY_TOKEN, 
          value: success.token,
        );
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
        ));
      },
    );
  }

  bool get isValid => state.emailValidation is SuccessValidationResult && state.passwordValidation is SuccessValidationResult;
}