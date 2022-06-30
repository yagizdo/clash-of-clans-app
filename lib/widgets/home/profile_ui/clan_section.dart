import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../model/profile.dart';

class ClanSecton extends StatelessWidget {
  ClanSecton({Key? key,required this.profile}) : super(key: key);
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
                  'Clan',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: white),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Image.network(
                    profile?.clan?.badgeUrls?.small ?? 'No Data',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '${profile?.clan?.name}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Tag : ${profile?.clan?.tag}',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Level : ${profile?.clan?.clanLevel}',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
