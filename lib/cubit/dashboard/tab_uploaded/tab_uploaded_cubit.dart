import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_uploaded_state.dart';
part 'tab_uploaded_cubit.freezed.dart';

class TabUploadedCubit extends Cubit<TabUploadedState> {
  TabUploadedCubit() : super(TabUploadedState.initial());
}
