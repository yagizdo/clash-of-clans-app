import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../core/profileStore.dart';
import '../locator.dart';
import '../widgets/profile/profile_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileStore profileStore = getIt.get<ProfileStore>();

  @override
  void dispose() {
    profileStore.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h,left: 26.w),
          child: ProfileSection(),
        ),
      ),
    );
  }
}
