import 'package:clash_of_clans_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_colors.dart';
import 'constants/app_string.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: appName,
        theme: AppTheme().appTheme,
        home: const SearchScreen(),
      ),
    );
  }
}