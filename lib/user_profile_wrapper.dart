import 'package:flutter/material.dart';
import 'package:intership_cycle_two/userprofile_screen.dart';

import 'auth_services.dart';

class UserProfileWrapper extends StatelessWidget {
  final AuthService _auth = AuthService();

  UserProfileWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _auth.getUserProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        if (snapshot.hasData) {
          final user = snapshot.data!;
          return UserProfileScreen(user: user);
        } else {
          return Scaffold(body: Center(child: Text('No user data found')));
        }
      },
    );
  }
}
