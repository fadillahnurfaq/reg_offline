import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_draft_state.dart';
part 'tab_draft_cubit.freezed.dart';

class TabDraftCubit extends Cubit<TabDraftState> {
  TabDraftCubit() : super(TabDraftState.initial());
}
