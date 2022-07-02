import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profileStore.dart';
import '../../locator.dart';
import '../../model/profile.dart';

class VillageSection extends StatelessWidget {
  const VillageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Profile Store
    final _profileStore = getIt.get<ProfileStore>();

// Profile data from the Profile Store
    final Profile? _profile = _profileStore.profile;

    return SizedBox(
      height: 250.h,
      child: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          // Town Hall Level
          villageSectionGrid(_profile!.townHallLevel.toString(),'Town Hall Level','lib/img/town_halls/Town_Hall_${_profile.townHallLevel}.webp'),

          // Tropies Count
          villageSectionGrid(_profile.trophies.toString(),'Trophies','lib/img/Trophy.png'),

          // Best Trophies
          villageSectionGrid(_profile.bestTrophies.toString(),'Best Trophies','lib/img/Trophy.png'),

          // Attak Wins
          villageSectionGrid(_profile.attackWins.toString(),'Attack Wins',cannon_cart),

          // Defense Wins
          villageSectionGrid(_profile.defenseWins.toString(),'Defense Wins',defenseShield),

          // Builder hall level
          villageSectionGrid(_profile.builderHallLevel.toString(),'Builder Hall Level','lib/img/town_halls/Builder_Hall_${_profile.builderHallLevel}.webp'),
        ],
      ),
    );
  }
}

Widget villageSectionGrid(String data,String title,String img_url) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
    child: Container(
      width: 104.w,
      height: 104.h,
      decoration: BoxDecoration(
        color: villageGridColor,
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img_url,fit: BoxFit.cover,scale: title == 'Town Hall Level' || title == 'Builder Hall Level' ? 2.5 : 1),
          Text(
            title,
            style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: brown),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
                color: brown),
          ),
        ],
      ),
    ),
  );
}
