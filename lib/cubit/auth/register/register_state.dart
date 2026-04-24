part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required final ValidatorResult emailValidation,
    required final ValidatorResult passwordValidation,
    required final ValidatorResult fullNameValidation,
  }) = _RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
      emailValidation: InitialValidationResult(),
      passwordValidation: InitialValidationResult(),
      fullNameValidation: InitialValidationResult(),
    );
  }
}