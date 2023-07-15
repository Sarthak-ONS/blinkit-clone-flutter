import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        automaticallyImplyLeading: true,
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Account'),
            Text('9457000000'),
          ],
        ),
      ),
    );
  }
}
