import 'package:flutter/material.dart';
import 'package:test_user_map/resources/app_images.dart';
import 'package:test_user_map/src/ui/widgets/auth/components/auth_button.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  AppImages.splash,
                ),
              ),
              const SizedBox(height: 100),
              const SizedBox(
                width: double.infinity,
                height: 100,
                child: AuthButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
