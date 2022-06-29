import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:clash_of_clans_app/widgets/home/profile_ui/hero_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/profile.dart';

class HeroesComp extends StatelessWidget {
  HeroesComp({Key? key,required this.profile}) : super(key: key);
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appbarColor,
      width: double.infinity,
      height: 0.32.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Sizedbox for top padding
          SizedBox(height: 15.h),

          // Hero title
          Center(
            child: Text(
              'Heroes',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h),

          // Hero Gridview
          SizedBox(
            width: double.infinity,
            height: 0.26.sh,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10.w,
                childAspectRatio: 1.5,
              ),
              itemCount: profile?.heroes?.length ?? 0,
              itemBuilder: (context, index) {
                return HeroCard(
                  hero: profile?.heroes?.elementAt(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
