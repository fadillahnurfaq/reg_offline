part of 'create_draft_cubit.dart';

@freezed
abstract class CreateDraftState with _$CreateDraftState {
  const factory CreateDraftState({
    required final ValidatorResult phoneNumberValidation,
    required final ValidatorResult nikValidation,
    required final ValidatorResult fullNameValidation,
    final File? primaryIndentityPhoto,
    final File? secondaryIndentityPhoto,
    final DateTime? dateOfBirth,
    final String? gender,
    final String? status,
    final String? occupation,
    final String? province,
    final String? city,
    final String? district,
    final String? subDistrict,
    required final bool isSubmitting,
    final String? errorMessage,
    final bool? isSuccessUpload,
    final bool? isSuccessSavedDraft,
  }) = _CreateDraftState;

  factory CreateDraftState.initial() {
    return CreateDraftState(
      phoneNumberValidation: InitialValidationResult(),
      nikValidation: InitialValidationResult(),
      fullNameValidation: InitialValidationResult(),
      isSubmitting: false
    );
  }
}
