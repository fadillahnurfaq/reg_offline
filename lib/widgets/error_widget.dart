import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          message ?? 'An error occurred. Please try again later.',
          textAlign: TextAlign.center,
          style: bodyLargeRegular.copyWith(color: AppColors.gray700),
        ),
      ),
    );
  }
}