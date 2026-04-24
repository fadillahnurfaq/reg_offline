import 'package:flutter/material.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/utils/extension/build_context_extension.dart';
import 'package:register_offline/utils/text_style.dart';
import 'package:register_offline/views/auth/register_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.pushReplacement(const RegisterView());
    });
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
            Icon(
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