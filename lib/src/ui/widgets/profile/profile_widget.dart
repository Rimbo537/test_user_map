import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_user_map/resources/app_icons.dart';
import 'package:test_user_map/resources/app_strings.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final curUser = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProfileStrings.profileAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    '${curUser.photoURL}',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text('${curUser.displayName}'),
                
              Text('${curUser.email}'),
            ],
          ),
        ),
      ),
    );
  }
}
