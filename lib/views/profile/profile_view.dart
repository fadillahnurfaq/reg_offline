import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/cubit/profile/profile_cubit.dart';
import 'package:register_offline/models/auth/user_model.dart';
import 'package:register_offline/services/member_local_service.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/string_extension.dart';
import 'package:register_offline/utils/injector.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/profile/widgets/logout_modal.dart';
import 'package:register_offline/views/splash_view.dart';

import '../../utils/dialog_helper.dart';
import '../../utils/extensions/build_context_extension.dart';

class ProfileView extends StatelessWidget {
  final UserModel user;
  const ProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        memberLocalService: locator<MemberLocalService>()
      ),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.isLoadingLogout) {
            context.hideKeyboard();
            DialogHelper.showLoading(context);
          } else {
            context.pop();
          }

          if (state.isSuccessLogout) {
            context.pushAndRemoveUntil(const SplashView());
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text("Profile", style: headlineSmallBold)),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(user.fullName.getText(), style: headlineSmallBold),
                  const SizedBox(height: 8.0),
                  Text("Rawalumbu, Bekasi, Jawa Barat", style: bodyRegular),
                  const SizedBox(height: 8.0),
                  Text(user.email.getText(), style: bodyRegular),
                  const SizedBox(height: 24.0),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.gray200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                spacing: 8.0,
                                children: [
                                  const Icon(
                                    Icons.password,
                                    size: 20.0,
                                    color: AppColors.black,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Ganti Password",
                                      style: bodyBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                spacing: 8.0,
                                children: [
                                  const Icon(
                                    Icons.help,
                                    size: 20.0,
                                    color: AppColors.black,
                                  ),
                                  Expanded(
                                    child: Text("Bantuan", style: bodyBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColors.gray200,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Builder(
                        builder: (context) {
                          return InkWell(
                            onTap: () {
                              DialogHelper.showBottomSheet(
                                context: context, 
                                showBar: false,
                                content: LogoutModal(
                                  onLogout: context.read<ProfileCubit>().logout,
                                )
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                spacing: 8.0,
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    size: 20.0,
                                    color: AppColors.red,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Keluar",
                                      style: bodyBold.copyWith(color: AppColors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
