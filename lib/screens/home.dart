import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/core/profileStore.dart';
import 'package:clash_of_clans_app/core/profile_client.dart';
import 'package:clash_of_clans_app/locator.dart';
import 'package:clash_of_clans_app/widgets/home/error_comp.dart';
import 'package:clash_of_clans_app/widgets/home/profile_ui/profile_comp.dart';
import 'package:clash_of_clans_app/widgets/home/search/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ProfileStore _profileStore = getIt.get<ProfileStore>();

  @override
  void initState() {
    //_profileStore.fetchProfile('PL0JV808');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizeBox is used to add space between widgets
            SizedBox(height: 20.h),

            // SearchBar widget
            const SearchBar(),

            // Profile Part
            Observer(builder: (_) {
              return _profileStore.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          _profileStore.profile == null
                              ?
                              // Empty container
                              Container()
                              :
                              // Error container
                              _profileStore.isError
                                  ?
                                  // Error container
                                  const ErrorComp()
                                  :
                                  // Profile container
                                  ProfileComp(
                                      profile: _profileStore.profile,
                                    ),
                        ],
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
