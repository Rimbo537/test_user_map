import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/resources/app_styles.dart';

class InfoCardWidget extends StatefulWidget {
  const InfoCardWidget({super.key});

  @override
  State<InfoCardWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
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
          final user = state.currentUser;
          return DecoratedBox(
            decoration: AppDecorations.infoMapWidget,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${user?.displayName}',
                    style: AppStyles.mapUserName,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${user?.email}',
                    style: AppStyles.mapEmail,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
