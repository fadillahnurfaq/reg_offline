import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:register_offline/models/member/member_model.dart';
import 'package:register_offline/services/member_service.dart';

import '../../../models/result.dart';

part 'tab_draft_state.dart';
part 'tab_draft_cubit.freezed.dart';

class TabDraftCubit extends Cubit<TabDraftState> {
  final MemberService memberService;

  TabDraftCubit({
    required this.memberService,
  }) : super(TabDraftState.initial());

}
