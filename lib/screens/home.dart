import 'package:clash_of_clans_app/constants/app_string.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeTitle),
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
