part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required final ValidatorResult emailValidation,
    required final ValidatorResult passwordValidation,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      emailValidation: InitialValidationResult(),
      passwordValidation: InitialValidationResult(),
    );
  }
}