import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/src/theme/app_colors.dart';
import 'package:test_user_map/src/ui/screens/auth/auth_screen.dart';
import 'package:test_user_map/src/ui/screens/profile/profile_screen.dart';
import 'package:test_user_map/src/ui/widgets/main/components/drawer_header.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.bgColor,
            ),
            child: UserHead(),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text(MainAppStrings.mainButton),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text(MainAppStrings.profileButton),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()))
            },
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(MainAppStrings.logoutButton),
              onTap: () {
                context.read<AuthBloc>().add(SignOutRequested());
                _signOutWithGoogle(context);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
              }),
        ],
      ),
    );
  }

  void _signOutWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      SignOutRequested(),
    );
  }
}
