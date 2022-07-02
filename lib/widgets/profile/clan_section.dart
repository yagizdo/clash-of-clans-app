import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../core/profileStore.dart';
import '../../locator.dart';
import '../../model/profile.dart';

class ClanSection extends StatelessWidget {
  const ClanSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Profile Store is injected via get it
    ProfileStore _profileStore = getIt.get<ProfileStore>();

    // Profile data is fetched from the Profile Store
    Profile? _profile = _profileStore.profile;

    return Container(
      width: 222.w,
      height: 103.h,

      // Rounded Corners
      decoration: BoxDecoration(
        color: clanOrange,
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _profile?.clan?.name ?? '',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${_profile?.clan?.tag}',
                style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600, color: white),
              ),
            ],
          ),
          Image.network(
            _profile?.clan?.badgeUrls?.medium ?? 'No Data',
            fit: BoxFit.cover,
            scale: 2.2,
          ),
        ],
      ),
    );
  }
}
