import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/widgets/home/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitle),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          SearchBar(),
        ],
      ),
    );
  }
}
