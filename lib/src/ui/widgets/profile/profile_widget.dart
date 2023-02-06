import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/resources/app_icons.dart';
import 'package:test_user_map/resources/app_images.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/resources/app_styles.dart';
import 'package:test_user_map/src/theme/app_colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeolocationBloc, GeolocationState>(
      listener: (context, state) {
        if (state.status == GeolocationStateStatus.failure &&
            state.errorMessage.isNotEmpty) {
          context.showErrorBar<String>(
            content: Text(state.errorMessage),
          );
        }
      },
      builder: (context, state) {
        if (state.status == GeolocationStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(ProfileStrings.profileAppBar),
              backgroundColor: AppColors.bgColor,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          '${state.currentUser?.photoURL}',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${state.currentUser?.displayName}',
                        style: AppStyles.profileTitle,
                      ),
                      Text(
                        '${state.currentUser?.email}',
                        style: AppStyles.profileSubtitle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
