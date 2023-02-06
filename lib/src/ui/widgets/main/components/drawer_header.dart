import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/resources/app_styles.dart';

class UserHead extends StatelessWidget {
  const UserHead({super.key});

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
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        '${state.currentUser?.photoURL}',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.currentUser?.displayName}',
                        style: AppStyles.drawerUserName,
                      ),
                      Text(
                        '${state.currentUser?.email}',
                        style: AppStyles.drawerEmail,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
