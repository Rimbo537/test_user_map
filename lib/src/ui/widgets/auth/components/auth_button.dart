import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/resources/app_icons.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/resources/app_styles.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _authenticateWithGoogle(context);
      },
      style: AppStyles.createUserButton,
      child: SizedBox(
        width: double.infinity,
        height: 44,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                AppIcons.googleLogo,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                MainAppStrings.authButton,
                style: AppStyles.authButton,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
