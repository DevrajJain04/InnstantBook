import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageView extends StatelessWidget {
  ProfilePageView({super.key});
  final email = FirebaseAuth.instance.currentUser?.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Column(
        children: [
          Text('Your E-Mail: \n ' '$email'),
        ],
      ),
    );
  }
}
