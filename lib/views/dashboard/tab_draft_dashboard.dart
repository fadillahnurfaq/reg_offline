import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/cubit/dashboard/tab_draft/tab_draft_cubit.dart';
import 'package:register_offline/services/member_local_service.dart';
import 'package:register_offline/services/member_service.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/dashboard/widgets/member_card_widget.dart';
import 'package:register_offline/views/draft/create_draft_view.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/main_route_observer.dart';
import '../../widgets/button.dart';
import '../../widgets/result_handler.dart';
import '../../widgets/sliver_marker.dart';

class TabDraftDashboard extends StatefulWidget {
  const TabDraftDashboard({super.key});

  @override
  State<TabDraftDashboard> createState() => _TabDraftDashboardState();
}

class _TabDraftDashboardState extends State<TabDraftDashboard> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => TabDraftCubit(
        memberService: locator<MemberService>(),
        memberLocalService: locator<MemberLocalService>()
      ),
      child: BlocListener<TabDraftCubit, TabDraftState>(
        listenWhen: (previous, current) => previous.isSubmitting != current.isSubmitting 
          || previous.errorMessage != current.errorMessage 
          || previous.isSuccessUpload != current.isSuccessUpload,
        listener: (context, state) {
          if (state.isSubmitting) {
            context.hideKeyboard();
            DialogHelper.showLoading(context);
          } else {
            context.pop();
          }

          if (state.errorMessage != null) {
            DialogHelper.showSnacbar(context: context, message: state.errorMessage!);
          }

          if (state.isSuccessUpload == true) {
            locator<MainRouteObserver>().onRefreshUploadedMember?.call();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.gray200,
          body: Builder(
            builder: (context) {
              return RefreshIndicator(
                onRefresh: context.read<TabDraftCubit>().getList,
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverMainAxisGroup(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12.0,
                              children: [
                                Text(
                                  "List Draft KTA",
                                  style: bodyLargeBold,
                                ),
                                Text(
                                  "Upload untuk mengirimkan data ini ke admin untuk di-verifikasi.",
                                  style: bodyRegular,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.gray300,
                                    borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Row(
                                    spacing: 8.0,
                                    children: [
                                      const Icon(Icons.info, size: 28.0, color: AppColors.primary),
                                      Flexible(
                                        child: Text(
                                          "Nomor Handphone, NIK, dan Foto KTP wajib diisi sebelum di-upload",
                                          style: bodyRegular.copyWith(color: AppColors.gray700),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 16.0),
                          ),
                          BlocBuilder<TabDraftCubit, TabDraftState>(
                            builder: (context, state) {
                              return ResultHandler(
                                requestState: state.resultMembers,
                                isSliver: true,
                                successWidget: (result) {
                                  return SliverMarker(
                                    sliver: SliverList.separated(
                                      itemCount: result.length,
                                      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
                                      itemBuilder: (context, index) {
                                        final member = result[index];
                                        return MemberCardWidget(
                                          index: index, 
                                          member: member,
                                          onEdit: () {
                                            
                                          },
                                          onUpload: () {
                                            context.read<TabDraftCubit>().upload(index: index, member: member);
                                          }
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            }
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: context.bottomPadding + 16.0,
                  top: 16.0
                ),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray200,
                      spreadRadius: 7,
                      blurRadius: 8,
                      offset: Offset(1, 4),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 8.0,
                  children: [
                    AppButton.filled(
                      width: double.infinity,
                      onPressed: () => context.push(const CreateDraftView()),
                      icon: const Icon(
                        Icons.add,
                        size: 20.0,
                        color: AppColors.white,
                      ),
                      label: "Tambah Data",
                    ),
                    BlocBuilder<TabDraftCubit, TabDraftState>(
                      buildWhen: (previous, current) => previous.resultMembers != current.resultMembers,
                      builder: (context, state) {
                        final members = state.resultMembers.resultValue?.where((element) => element.syncType.isDraft).toList() ?? [];
                        final length = members.length;
                        return AppButton.outlined(
                          width: double.infinity,
                          onPressed: () => context.read<TabDraftCubit>().uploadBulk(members: members),
                          disabled: length == 0,
                          sideColor: AppColors.primary,
                          icon: const Icon(
                            Icons.file_upload_outlined,
                            size: 20.0,
                            color: AppColors.primary,
                          ),
                          label: "Upload Semua ($length)",
                        );
                      },
                    )
                  ],
                ),
              )
            ]
          ),
        )
      ),
    );
  }
}
