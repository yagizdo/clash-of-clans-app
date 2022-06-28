import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:clash_of_clans_app/core/profileStore.dart';
import 'package:clash_of_clans_app/core/profile_client.dart';
import 'package:clash_of_clans_app/locator.dart';
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
      body: Column(
        children: [
          SizedBox(height: 20.h),
          SearchBar(),
          Observer(builder: (_){
            return Text(_profileStore.profile?.name ?? 'No name');
          }),
        ],
      ),
    );
  }
}
