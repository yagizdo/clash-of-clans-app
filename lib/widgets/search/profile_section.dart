import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../model/profile.dart';

class ProfileSection extends StatelessWidget {
  ProfileSection({Key? key,required this.profile}) : super(key: key);
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 0.30.sh,
        color: appbarColor,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: white),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Name : ${profile?.name}',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Tag : ${profile?.tag}',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Profile Level : ${profile?.expLevel}',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'TH Level : ${profile?.townHallLevel}',
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Trophies : ${profile?.trophies}',
                style: TextStyle(fontSize: 15.sp),
              ),
              Row(
                children: [
                  Text('${profile?.league?.name}', style: TextStyle(fontSize: 14.sp,color: Colors.black),),
                  SizedBox(width: 5.w),
                  Image.network(profile?.league?.iconUrls?.tiny ?? '',),
                ],
              ),
              Text(
                'Best Trophies : ${profile?.bestTrophies}',
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
