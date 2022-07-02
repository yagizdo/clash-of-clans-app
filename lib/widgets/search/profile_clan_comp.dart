import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../model/profile.dart';
import 'clan_section.dart';
import 'profile_section.dart';

class ProfileClanComp extends StatelessWidget {
  ProfileClanComp({Key? key,required this.profile}) : super(key: key);
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Section
        ProfileSection(profile: profile),
        SizedBox(
          width: 10.w,
        ),

        // Clan Section
        ClanSecton(profile: profile),

      ],
    );
  }
}
