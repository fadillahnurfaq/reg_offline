import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_offline/cubit/dashboard/tab_draft/tab_draft_cubit.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/draft/create_draft_view.dart';

import '../../widgets/button.dart';

class TabDraftDashboard extends StatelessWidget {
  const TabDraftDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabDraftCubit(),
      child: Scaffold(
        body: CustomScrollView(
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
                            color: AppColors.gray200,
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
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: context.bottomPadding,
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
                  AppButton.outlined(
                    width: double.infinity,
                    onPressed: () {},
                    sideColor: AppColors.primary,
                    icon: const Icon(
                      Icons.file_upload_outlined,
                      size: 20.0,
                      color: AppColors.primary,
                    ),
                    label: "Upload Semua (6)",
                  ),
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}
