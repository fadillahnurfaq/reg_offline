import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double get headlineLargeSize => 20.sp;
double get headlineMediumSize => 18.sp;
double get headlineSmallSize => 16.sp;
double get bodyLargeSize => 14.sp;
double get bodySize => 12.sp;
double get bodySmallSize => 10.sp;
double get captionSize => 8.sp;

// Bold
TextStyle get headlineLargeBold => TextStyle(fontSize: headlineLargeSize, fontWeight: bold, color: Colors.black);
TextStyle get headlineMediumBold => headlineLargeBold.copyWith(fontSize: headlineMediumSize);
TextStyle get headlineSmallBold => headlineLargeBold.copyWith(fontSize: headlineSmallSize);
TextStyle get bodyLargeBold => headlineLargeBold.copyWith(fontSize: bodyLargeSize);
TextStyle get bodyBold => headlineLargeBold.copyWith(fontSize: bodySize);
TextStyle get bodySmallBold => headlineLargeBold.copyWith(fontSize: bodySmallSize);
TextStyle get captionBold => headlineLargeBold.copyWith(fontSize: captionSize);

// Regular
TextStyle get headlineLargeRegular => TextStyle(fontSize: headlineLargeSize, fontWeight: regular, color: Colors.black);
TextStyle get headlineMediumRegular => headlineLargeRegular.copyWith(fontSize: headlineMediumSize);
TextStyle get headlineSmallRegular => headlineLargeRegular.copyWith(fontSize: headlineSmallSize);
TextStyle get bodyLargeRegular => headlineLargeRegular.copyWith(fontSize: bodyLargeSize);
TextStyle get bodyRegular => headlineLargeRegular.copyWith(fontSize: bodySize);
TextStyle get bodySmallRegular => headlineLargeRegular.copyWith(fontSize: bodySmallSize);
TextStyle get captionRegular => headlineLargeRegular.copyWith(fontSize: captionSize);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;