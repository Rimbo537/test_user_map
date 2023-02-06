// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/src/theme/app_colors.dart';

class ShowUserButton extends StatelessWidget {
  ShowUserButton({
    super.key,
    required this.mapController,
    required this.position,
  });
  MapController mapController = MapController();
  Position? position;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, state) {
        return Positioned(
          bottom: 20,
          right: 140,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(AppColors.bgColor),
              ),
              onPressed: () {
                mapController.moveAndRotate(
                    LatLng(
                      position?.latitude ?? 0,
                      position?.longitude ?? 0,
                    ),
                    9.4,
                    0);
              },
              child: const Text(MainAppStrings.showUser),
            ),
          ),
        );
      },
    );
  }
}
