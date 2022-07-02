import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/core/profileStore.dart';
import 'package:clash_of_clans_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../widgets/search/searchbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ProfileStore _profileStore = getIt.get<ProfileStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // SearchBar widget
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Clash of Clans',
                    style: TextStyle(
                        color: const Color(0xFF835234),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Profile Search Engine',
                    style: TextStyle(
                        color: const Color(0xFF835234),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const SearchBar(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Observer(
                    builder: (_) => _profileStore.isError
                        ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44.w),
                          child: Text(
                              'Oops, user not found. Please check your player tag and try again.',
                              style: TextStyle(color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                            ),
                        )
                        : Container(
                            height: 10.h,
                          ),
                  )
                ],
              ),

              Observer(builder: (_) {
                return Positioned(
                  right: 150.w,
                  bottom: 550.h,
                  child: Container(
                    height: 434.h,
                    width: 434.w,
                    decoration: BoxDecoration(
                      color: _profileStore.isError
                          ? Colors.red
                          : Color(0xFFFFB82A),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),

              Observer(builder: (_) {
                return Positioned(
                  left: 150.w,
                  top: 600.h,
                  child: Container(
                    height: 434.h,
                    width: 434.w,
                    decoration: BoxDecoration(
                      color: _profileStore.isError
                          ? Colors.red
                          : Color(0xFFFFB82A),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
