import 'package:flutter/material.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/widgets/button.dart';

class LogoutModal extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutModal({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16.0),
        Row(
          spacing: 8.0,
          children: [
            IconButton(
              onPressed: context.pop, 
              icon: const Icon(
                Icons.close,
                size: 20.0,
                color: AppColors.black,
              ),
            ),
            Text(
              "Keluar",
              style: bodyLargeBold,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(
                Icons.info,
                size: 100.0,
              ),
              const SizedBox(height: 16.0),
              Text(
                "Apakah kamu yakin ingin keluar?",
                style: bodyLargeBold,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Data yang ada di draft-mu mungkin akan hilang. Kami sarankan untuk upload terlebih dahulu",
                textAlign: TextAlign.center,
                style: bodyRegular,
              ),
              const SizedBox(height: 24.0),
              AppButton.filled(
                width: double.infinity,
                onPressed: () {
                  context.pop();
                  onLogout.call();
                },
                label: "Ya, keluar",
              ),
              const SizedBox(height: 8.0),
              AppButton.outlined(
                width: double.infinity,
                onPressed: context.pop,
                label: "Batal",
              ),
            ],
          ),
        )
      ],
    );
  }
}