import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.textTitle,
    this.isBlue = false,
  });

  final String? textTitle;
  final bool isBlue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textTitle ?? "There are no data yet",
        textAlign: TextAlign.center,
        style: bodyRegular.copyWith(fontSize: 14, color: AppColors.gray700),
      ),
    );
  }
}