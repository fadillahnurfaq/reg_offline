import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:register_offline/models/auth/get_user_parameter.dart';
import 'package:register_offline/models/auth/user_model.dart';
import 'package:register_offline/models/result.dart';
import 'package:register_offline/services/auth_service.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final AuthService authService;
  DashboardCubit({
    required this.authService,
  }) : super(DashboardState.initial()) {
    getUser();
  }

  Future<void> getUser() async {
    emit(state.copyWith(resultUser: const Result.loading()));
    final result = await authService.getUser(parameter: GetUserParameter());
    result.fold((l) {
      emit(state.copyWith(resultUser: Result.failed(l.message)));
    }, (r) {
      emit(state.copyWith(resultUser: Result.success(r)));
    },);
  }
}
