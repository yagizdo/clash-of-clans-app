import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profileStore.dart';
import '../../locator.dart';
import '../../model/profile.dart';

class LeagueSection extends StatelessWidget {
  const LeagueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Profile Store
    final ProfileStore profileStore = getIt.get<ProfileStore>();

    // Profile data from the Profile Store is fetched and used to display the league information
    Profile? profile = profileStore.profile;


    return Container(
      width: 103.w,
      height: 103.h,
      decoration: BoxDecoration(
        color: leaguePurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Column(
        children: [
          Image.network(
            profile?.league?.iconUrls?.small ?? 'No Data',
            scale: 1.2,
          ),
          Text(
            '${profile?.league?.name}',
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: leagueTextPurple),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
