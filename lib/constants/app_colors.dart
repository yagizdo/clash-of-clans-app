import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const black = Color(0xFF101823);
const scaffoldBackground = Color(0xFFFFFFFF);
const appbarColor = Color(0xFFD7A640);
const white = Color(0xFFFFFFFF);
const grey = Color(0xFF787878);

const brown = Color(0xFF835234);
const red = Color(0xFFCC0000);
const orange = Color(0xFFFFB82A);
const clanOrange = Color(0xFFF8BB54);
const leaguePurple = Color(0xFF8624C5);
const leagueTextPurple = Color(0xFF7E25B7);
const villageGridColor = Color(0xFFF6F7F8);

const grey2 = Color(0xFF7E909D);


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