import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:register_offline/models/member/member_model.dart';
import 'package:register_offline/services/member_service.dart';
import '../../../models/result.dart';
import '../../../services/member_local_service.dart';
import '../../../utils/injector.dart';
import '../../../utils/main_route_observer.dart';

part 'tab_draft_state.dart';
part 'tab_draft_cubit.freezed.dart';

class TabDraftCubit extends Cubit<TabDraftState> {
  final MemberService memberService;
  final MemberLocalService memberLocalService;

  TabDraftCubit({
    required this.memberService,
    required this.memberLocalService,
  }) : super(TabDraftState.initial()) {
    getList();
    locator<MainRouteObserver>().onRefreshDraftMember = getList;
  }

  @override
  Future<void> close() {
    locator<MainRouteObserver>().onRefreshDraftMember = null;
    return super.close();
  }


  Future<void> getList() async {
    emit(state.copyWith(resultMembers: const Result.loading()));
    final result = await memberLocalService.getList();
    emit(state.copyWith(resultMembers: result.fold(
      (l) => Result.failed(l),
      (r) => Result.success(r),
    )));
  }

  Future<void> upload({required final int index, required final MemberModel member}) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null, isSuccessUpload: null));
    final result = await memberService.create(parameter: member.toCreateParameter());
    result.fold((failure) {
      emit(state.copyWith(isSubmitting: false, errorMessage: failure.message, isSuccessUpload: false));
    }, (success) {
      emit(state.copyWith(isSubmitting: false, isSuccessUpload: true, errorMessage: null));
      patchSingleSyncType(index: index);
    });
  }


  Future<void> patchSingleSyncType({required final int index}) async {
    final List<MemberModel> members = List.from(state.resultMembers.resultValue ?? []);
    members[index] = members[index].copyWith(syncType: MemberSyncType.uploaded);
    emit(state.copyWith(resultMembers: Result.success(members)));
    await memberLocalService.createOrEdit(members[index]);
  }

  Future<void> patchBulkSyncType({
    required final List<MemberModel> members,
  }) async {
    final List<MemberModel> currentMembers = List.from(state.resultMembers.resultValue ?? []);

    final Map<String, MemberModel> updatedMap = {
      for (var m in members)
        m.userId: m.copyWith(syncType: MemberSyncType.uploaded),
    };

    final List<MemberModel> updatedState = currentMembers.map((member) {
      if (updatedMap.containsKey(member.userId)) {
        return updatedMap[member.userId]!;
      }
      return member;
    }).toList();

    emit(state.copyWith(
      resultMembers: Result.success(updatedState),
    ));

    await memberLocalService.createBulkdOrEdit(
      updatedMap.values.toList(),
    );
  }


  Future<void> uploadBulk({
    required List<MemberModel> members,
  }) async {
    emit(state.copyWith(
      isSubmitting: true,
      errorMessage: null,
      isSuccessUpload: null,
    ));

    final List<String> failedIds = [];
    final List<MemberModel> successMembers = [];

    await Future.wait(
      members.map((member) async {
        final result = await memberService.create(
          parameter: member.toCreateParameter(),
        );

        result.fold(
          (failure) {
            failedIds.add(member.userId);
          },
          (_) {
            successMembers.add(member);
          },
        );
      }),
    );

    if (failedIds.isNotEmpty) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccessUpload: false,
        errorMessage: _buildErrorMessage(failedIds),
      ));
    } else {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccessUpload: true,
      ));
    }
    if (successMembers.isNotEmpty) {
      patchBulkSyncType(members: successMembers);
    }
  }

  String _buildErrorMessage(List<String> ids) {
    final buffer = StringBuffer();

    buffer.writeln("Gagal upload member :");

    for (int i = 0; i < ids.length; i++) {
      buffer.writeln("${i + 1}. ${ids[i]}");
    }

    return buffer.toString();
  }
}
