import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/cubit/dashboard/dashboard_cubit.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/views/dashboard/tab_draft_dashboard.dart';
import 'package:register_offline/views/dashboard/tab_uploaded_dashboard.dart';
import 'package:register_offline/views/profile/profile_view.dart';
import 'package:register_offline/widgets/button.dart';
import 'package:register_offline/widgets/result_handler.dart';
import 'package:register_offline/widgets/skeleton_loading_wid.dart';
import '../../services/auth_service.dart';
import '../../utils/text_style.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
        authService: locator<AuthService>(),
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.gray200,
          appBar: AppBar(
            title: Row(
              spacing: 8.0,
              children: [
                const Icon(Icons.document_scanner, size: 30.0),
                Flexible(
                  child: Text("Register Offline", style: headlineSmallBold),
                ),
              ],
            ),
            actions: [
              BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  return ResultHandler(
                    requestState: state.resultUser,
                    errorWidget: (message) => const SizedBox.shrink(),
                    loadingWidget: const SkeletonLoadingWid(
                      height: 24.0,
                      width: 150.0,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                    successWidget: (result) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AppButton.outlined(
                          borderRadius: 50.0,
                          height: 24.0,
                          onPressed: () => context.push(ProfileView(user: result)),
                          suffixIcon: const Icon(
                            Icons.account_circle_outlined,
                            size: 20.0,
                            color: AppColors.black,
                          ),
                          label: result.fullName,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab, // Required for insets to work relative to label
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: AppColors.primary), // Change thickness/color
              ),
              labelStyle: bodyBold.copyWith(
                color: AppColors.primary,
              ),
              tabs: const [
                Tab(icon: Text("Draft")),
                Tab(icon: Text("Sudah Di-Upload")),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TabDraftDashboard(),
              TabUploadedDashboard()
            ]
          ),
        ),
      ),
    );
  }
}
