part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) final bool isLoadingLogout,
    @Default(false) final bool isSuccessLogout,
    @Default(Result.initial()) final Result<String> resultAppVersion,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
