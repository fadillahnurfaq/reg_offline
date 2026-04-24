import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_offline/utils/colors.dart';
import 'package:register_offline/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          title: 'Register Offline',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: AppColors.primary,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            )
          ),
          home: const SplashView(),
        );
      }
    );
  }
}