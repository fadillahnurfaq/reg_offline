import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/cubit/dashboard/tab_uploaded/tab_uploaded_cubit.dart';
import 'package:register_offline/services/member_service.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/string_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/utils/masking_util.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/widgets/result_handler.dart';
import 'package:register_offline/widgets/sliver_marker.dart';

class TabUploadedDashboard extends StatefulWidget {
  const TabUploadedDashboard({super.key});

  @override
  State<TabUploadedDashboard> createState() => _TabUploadedDashboardState();
}

class _TabUploadedDashboardState extends State<TabUploadedDashboard> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => TabUploadedCubit(
        memberService: locator<MemberService>()
      ),
      child: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: context.read<TabUploadedCubit>().getMembers,
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
                              "Data yang sudah di-upload",
                              style: bodyLargeBold,
                            ),
                            Text(
                              "Data-data ini sudah dikirimkan ke admin verifikator.",
                              style: bodyRegular,
                            ),
                          ],
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 16.0),
                      ),
                      BlocBuilder<TabUploadedCubit, TabUploadedState>(
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
                                    return Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: AppColors.gray200,
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: Offset(1, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 8.0,
                                        children: [
                                          Text(
                                            MaskingUtil.mask(value: member.nik.getText()),
                                            style: bodyRegular,
                                          ),
                                          Text(
                                            MaskingUtil.mask(value: member.phoneNumber.getText()),
                                            style: bodyRegular,
                                          ),
                                        ],
                                      ),
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
    );
  }
}
