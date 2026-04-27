import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:register_offline/services/member_local_service.dart';
import 'package:register_offline/utils/secure_storage_manager.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final MemberLocalService memberLocalService;
  ProfileCubit({
    required this.memberLocalService,
  }) : super(ProfileState.initial());

  Future<void> logout() async {
    emit(state.copyWith(isLoadingLogout: true));

    await SecureStorageManager.instance.deleteAuthSession();
    await memberLocalService.removeAll();

    emit(state.copyWith(isLoadingLogout: false, isSuccessLogout: true));
  }
}
