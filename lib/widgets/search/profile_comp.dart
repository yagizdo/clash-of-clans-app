import 'package:clash_of_clans_app/widgets/search/profile_clan_comp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/profile.dart';
import 'heroes_comp.dart';

class ProfileComp extends StatelessWidget {
  ProfileComp({Key? key, required this.profile}) : super(key: key);

  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile and clan info section
        ProfileClanComp(profile: profile),

        // Sizedbox to separate the profile and clan info section from the heroes section
        SizedBox(height: 20.h),

        // Heroes section
        HeroesComp(profile: profile,),
      ],
    );
  }
}