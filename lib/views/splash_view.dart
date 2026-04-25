import 'package:flutter/material.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extensions/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/auth/login_view.dart';
import 'package:register_offline/views/dashboard/dashboard_view.dart';

import '../utils/secure_storage_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  void _checkToken() async {
    final hasToken = await SecureStorageManager.instance.hasToken();
    Future.delayed(const Duration(milliseconds: 500));
    if (hasToken) {
      context.pushReplacement(const DashboardView());
    } else {
      context.pushReplacement(const LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6.0,
          children: [
            const Icon(
              Icons.document_scanner,
              size: 60.0,
              color: Colors.white,
            ),
            Text(
              'Register Offline',
              style: headlineSmallBold.copyWith(
                color: AppColors.white
              )
            )
          ],
        ),
      ),
    );
  }
}