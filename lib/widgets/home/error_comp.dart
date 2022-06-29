import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorComp extends StatelessWidget {
  const ErrorComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

          // SizeBox is used to add space between widgets
          SizedBox(height: 10.h),


          Text(
            'Something went wrong',
            style: TextStyle(color: Colors.black, fontSize: 25.sp),
          ),
          SizedBox(height: 5.h),
          Text(
            'Please try again later',
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
