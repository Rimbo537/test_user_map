import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc/auth_bloc.dart';
import 'package:test_user_map/resources/app_images.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/resources/app_styles.dart';
import 'package:test_user_map/src/ui/screens/auth/auth_screen.dart';
import 'package:test_user_map/src/ui/screens/profile/profile_screen.dart';

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
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.drawerImage))),
            child: Center(
              child: Text(
                MainAppStrings.sideMenuName,
                style: AppStyles.titleStyle,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text(MainAppStrings.mainButton),
          onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text(MainAppStrings.profileButton),
            //  onTap: () => {Navigator.of(context).pop()}, "pop" replace to "push", чтобы оставить аппБар
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen()))
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const ProfileScreen()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text(MainAppStrings.logoutButton),
            onTap: () => {
               context.read<AuthBloc>().add(SignOutRequested())
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const AuthScreen()))
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const AuthScreen()))
            },
          ),
        ],
      ),
    );
  }
  //  void _signOutWithGoogle(context) {
  //   BlocProvider.of<AuthBloc>(context).add(
  //     SignOutRequested(),
  //   );
  // }
}
