import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_string.dart';
import '../../core/profileStore.dart';
import '../../locator.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Profile Store
    final _profileStore = getIt.get<ProfileStore>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name and tag of the player and level of the player
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Name of the player and tag of the player
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_profileStore.profile?.name}',
                  style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w800,
                      color: brown),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(
                    '${_profileStore.profile?.tag}',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: black.withOpacity(0.5)),
                  ),
                ),
              ],
            ),

            // Level of the player
            Padding(
              padding: EdgeInsets.only(right: 26.w),
              child: Column(
                children: [
                  // Level Image Stack
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(levelStar),
                      Positioned(
                          top: 8.h,
                          child: Text(
                            '${_profileStore.profile?.expLevel}',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: white),
                          )),
                    ],
                  ),

                  // Experience text
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      'Experience',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: grey2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
