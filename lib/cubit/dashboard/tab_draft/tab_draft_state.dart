part of 'tab_draft_cubit.dart';

@freezed
abstract class TabDraftState with _$TabDraftState {
  const factory TabDraftState({
    required final Result<List<MemberModel>> resultMembers,
    required final bool isSubmitting,
    final String? errorMessage,
    final bool? isSuccessUpload,
  }) = _TabDraftState;

  factory TabDraftState.initial() {
    return const TabDraftState(
      resultMembers: Result.initial(),
      isSubmitting: false,
    );
  }
}
