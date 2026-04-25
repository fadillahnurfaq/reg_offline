import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/member/get_member_parameter.dart';
import '../../../models/member/member_model.dart';
import '../../../models/result.dart';
import '../../../services/member_service.dart';
import '../../../utils/injector.dart';
import '../../../utils/main_route_observer.dart';

part 'tab_uploaded_state.dart';
part 'tab_uploaded_cubit.freezed.dart';

class TabUploadedCubit extends Cubit<TabUploadedState> {
  final MemberService memberService;
  TabUploadedCubit({
    required this.memberService,
  }) : super(TabUploadedState.initial()) {
    getMembers();
    locator<MainRouteObserver>().onRefreshUploadedMember = getMembers;
  }

  @override
  Future<void> close() {
    locator<MainRouteObserver>().onRefreshUploadedMember = null;
    return super.close();
  }

  Future<void> getMembers() async {
    emit(state.copyWith(resultMembers: const Result.loading()));
    final result = await memberService.getList(parameter: GetMemberParameter());
    emit(state.copyWith(resultMembers: result.fold(
      (l) => Result.failed(l.message),
      (r) => Result.success(r),
    )));
  }
}
