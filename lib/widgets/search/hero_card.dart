import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroCard extends StatelessWidget {
  HeroCard({Key? key, required this.hero}) : super(key: key);
  Heroes? hero;
  @override
  Widget build(BuildContext context) {

    // Hero Images List
    List heroes = [
      barbarianKing,
      archerQueen,
      grandWarden,
      royalChampion,
      battleMachine,
    ];
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Hero Image
            Image.asset(
              // Check hero name from list heroes above and get image from assets folder by name of hero
              hero?.name == 'Barbarian King'
                  ? heroes[0]
                  : hero?.name == 'Archer Queen'
                      ? heroes[1]
                      : hero?.name == 'Grand Warden'
                          ? heroes[2]
                          : hero?.name == 'Royal Champion'
                              ? heroes[3]
                              : hero?.name == 'Battle Machine'
                                  ? heroes[4]
                                  : heroes[0],
              scale: hero?.name == 'Archer Queen' ? 1.8 : 1,
            ),

            // Hero Name
            Text(
              '${hero?.name}',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),

            // Sizedbox for space between hero name and level
            SizedBox(height: 5.h),

            // Hero Level
            Text(
              'Level : ${hero?.level}',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
