part of 'tab_draft_cubit.dart';

@freezed
abstract class TabDraftState with _$TabDraftState {
  const factory TabDraftState({
    required final Result<List<MemberModel>> resultMembers,
  }) = _TabDraftState;

  factory TabDraftState.initial() {
    return const TabDraftState(
      resultMembers: Result.initial(),
    );
  }
}
