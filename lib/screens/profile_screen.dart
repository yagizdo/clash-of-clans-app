import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/widgets/profile/village_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../core/profileStore.dart';
import '../locator.dart';
import '../widgets/profile/clan_section.dart';
import '../widgets/profile/leauge_section.dart';
import '../widgets/profile/profile_section.dart';
import '../widgets/profile/troops_section.dart';

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
          padding: EdgeInsets.only(top: 10.h,left: 20.w),
          child: Column(
            children: [
              const ProfileSection(),

              // SizedBox to make space between the sections
              SizedBox(
                height: 15.h,
              ),

              // Clan and Leugue Section
              Row(
                children: [
                  const ClanSection(),
                  SizedBox(
                    width: 20.w,
                  ),
                  const LeagueSection(),
                ],
              ),

              // SizedBox to make space between the sections
              SizedBox(
                height: 15.h,
              ),

              // Village Section
              const VillageSection(),

              // Troops Section
              const TroopsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
