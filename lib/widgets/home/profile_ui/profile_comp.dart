import 'package:clash_of_clans_app/widgets/home/profile_ui/profile_clan_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../model/profile.dart';

class ProfileComp extends StatelessWidget {
  ProfileComp({Key? key, required this.profile}) : super(key: key);

  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirstComp(profile: profile),
        SizedBox(height: 20.h),
      ],
    );
  }
}
