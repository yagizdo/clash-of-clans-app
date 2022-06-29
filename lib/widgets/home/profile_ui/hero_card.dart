import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroCard extends StatelessWidget {
  HeroCard({Key? key,required this.hero}) : super(key: key);
  Heroes? hero;
  @override
  Widget build(BuildContext context) {
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
            Image.asset(
            hero?.name == 'Barbarian King' ? heroes[0] :
                hero?.name == 'Archer Queen' ? heroes[1] :
                    hero?.name == 'Grand Warden' ? heroes[2] :
                        hero?.name == 'Royal Champion' ? heroes[3] :
                            hero?.name == 'Battle Machine' ? heroes[4] :
                                heroes[0],scale: hero?.name == 'Archer Queen' ? 1.8 : 1,),
            Text('${hero?.name}', style: TextStyle(
              fontSize: 15.sp,
            ),),
            Text('Level : ${hero?.level}', style: TextStyle(
              fontSize: 14.sp,
            ),),
          ],
        ),
      ),
    );
  }
}
