import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const black = Color(0xFF101823);
const scaffoldBackground = Color(0xFFEFE1C4);
const appbarColor = Color(0xFFD7A640);
const white = Color(0xFFFFFFFF);
const grey = Color(0xFF787878);


class AppTheme {
  final appTheme = ThemeData(
    // Scaffold
    scaffoldBackgroundColor: scaffoldBackground,
    // Appbar
    appBarTheme: const AppBarTheme(backgroundColor: appbarColor,elevation: 0.1),
    // Text
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: white,
      ),
    ),
  );
}