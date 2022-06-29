import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../model/profile.dart';

class FirstComp extends StatelessWidget {
  FirstComp({Key? key,required this.profile}) : super(key: key);
  Profile? profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.3.sh,
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
                    'Name : ${profile?.name}' ?? 'No Data',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Tag : ${profile?.tag}' ?? 'No Data',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Level : ${profile?.expLevel}' ?? 'No Data',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Town Hall Level : ${profile?.townHallLevel}' ?? 'No Data',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),

        // Clan Part
        Expanded(
          child: Container(
            height: 0.3.sh,
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
                        '${profile?.clan?.name}' ?? 'No Data',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Tag : ${profile?.clan?.tag}' ?? 'No Data',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Level : ${profile?.clan?.clanLevel}' ?? 'No Data',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
