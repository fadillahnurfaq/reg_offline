part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required final ValidatorResult emailValidation,
    required final ValidatorResult passwordValidation,
    required final bool isLoading,
    required final String? errorMessage,
    required final bool? isSuccess,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      emailValidation: InitialValidationResult(),
      passwordValidation: InitialValidationResult(),
      isLoading: false,
      errorMessage: null,
      isSuccess: null,
    );
  }
}