import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class ClanSection extends StatelessWidget {
  const ClanSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 222.w,
      height: 103.h,
      color: clanOrange,
    );
  }
}
