part of 'dashboard_cubit.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    required Result<UserModel> resultUser,
  }) = _DashboardState;

  factory DashboardState.initial() {
    return const DashboardState(
      resultUser: Result.initial(),
    );
  }
}
