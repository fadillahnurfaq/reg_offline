part of 'tab_uploaded_cubit.dart';

@freezed
abstract class TabUploadedState with _$TabUploadedState {
  const factory TabUploadedState({
    required final Result<List<MemberModel>> resultMembers,
  }) = _TabUploadedState;

  factory TabUploadedState.initial() {
    return const TabUploadedState(
      resultMembers: Result.initial(),
    );
  }
}
