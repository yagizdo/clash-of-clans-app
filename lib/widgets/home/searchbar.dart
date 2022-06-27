import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/profile_client.dart';
import 'custom_debouncer.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  // Text controller for the search bar
  late TextEditingController controller;

  // Debouncer for the search bar
  Debouncer debouncer = Debouncer(milliseconds: 500);

// Profile client for the search bar
  ProfileClient profileClient = ProfileClient();


  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if(value != '') {
            if(value.contains('#')) {
             print('YOU BREAK THE RULE GOD DAMN IT');
            } else {
              // Run the debouncer
              debouncer.run(() {
                profileClient.getPlayer(value).then((value) {
                  print(value.name);
                });
              });
            }
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
          labelText: 'Search Account with #tag',
        ),
      ),
    );
  }
}
