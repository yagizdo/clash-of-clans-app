import 'package:clash_of_clans_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/profile.dart';

class LeagueComp extends StatelessWidget {
  LeagueComp({Key? key,required this.profile}) : super(key: key);
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appbarColor,
      width: double.infinity,
      height: 0.3.sh,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('League', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: Colors.white),)),
            SizedBox(height: 10.h),
            Row(
              children: [
                Image.network(profile?.league?.iconUrls?.small ?? '',scale: 1.3,),
                SizedBox(width: 10.w),
                Text('${profile?.league?.name}', style: TextStyle(fontSize: 17.sp,color: Colors.black),),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Trophies : ${profile?.trophies}',
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Best Trophies : ${profile?.bestTrophies}',
              style: TextStyle(fontSize: 17.sp),
            ),
          ],
        ),
      ),
    );
  }
}
