import 'package:flutter/material.dart';

import '../core/profileStore.dart';
import '../locator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileStore profileStore = getIt.get<ProfileStore>();

  @override
  void dispose() {
    profileStore.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Profile Screen ${profileStore.profile?.name}'),
          ],
        ),
      ),
    );
  }
}
