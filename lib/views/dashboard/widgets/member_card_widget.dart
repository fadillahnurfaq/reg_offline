import 'dart:io';

import 'package:flutter/material.dart';
import 'package:register_offline/models/member/member_model.dart';
import 'package:register_offline/utils/assets.dart';

import '../../../utils/colors.dart';
import '../../../utils/extensions/string_extension.dart';
import '../../../utils/masking_util.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/bounceable.dart';
import '../../../widgets/image_cached_network_image.dart';

class MemberCardWidget extends StatelessWidget {
  final int index;
  final MemberModel member;
  final VoidCallback? onEdit;
  final VoidCallback? onUpload;

  const MemberCardWidget({
    super.key, 
    required this.index, 
    required this.member,
    this.onEdit,
    this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              spacing: 8.0,
              children: [
                Container(
                  height: 24.0,
                  width: 24.0,
                  decoration: BoxDecoration(
                    color: AppColors.gray200,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      color: AppColors.gray400,
                    )
                  ),
                  child: Center(
                    child: Text(
                      "${index + 1}",
                      style: bodyBold,
                    ),
                  ),
                ),
                if (member.primaryIndentityPhotoPath != null)...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 54.0,
                      width: 100.0,
                      child: Image.file(
                        File(member.primaryIndentityPhotoPath!),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              Assets.noImage,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ] else if (member.primaryIdentityPhotoUrl.isNotEmpty)...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 54.0,
                      width: 100.0,
                      child: ImageCachedNetworkImage(
                        imageUrl: member.primaryIdentityPhotoUrl
                      ),
                    ),
                  ),
                ],
                Expanded(
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: member.syncType.backgroundColor,
                  ),
                  child: Text(
                    member.syncType.label,
                    style: bodyBold.copyWith(
                      color: member.syncType.textColor
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (onEdit != null && onUpload != null && member.syncType.isDraft)...[
            const Divider(color: AppColors.gray200, height: 0.0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Bounceable(
                      hitTestBehavior: HitTestBehavior.translucent,
                      onTap: onEdit,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8.0,
                          children: [
                            const Icon(
                              Icons.edit,
                              color: AppColors.primary,
                              size: 24.0,
                            ),
                            Text(
                              "Edit",
                              style: bodyLargeBold.copyWith(
                                color: AppColors.primary
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 2.0,
                    decoration: const BoxDecoration(
                      color: AppColors.gray200
                    ),
                  ),
                  Expanded(
                    child: Bounceable(
                      hitTestBehavior: HitTestBehavior.translucent,
                      onTap: onUpload,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8.0,
                          children: [
                            const Icon(
                              Icons.file_upload_outlined,
                              color: AppColors.primary,
                              size: 24.0,
                            ),
                            Text(
                              "Upload",
                              style: bodyLargeBold.copyWith(
                                color: AppColors.primary
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}