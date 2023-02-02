import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/data/repositories/geolocation/geolocation_repository.dart';
import 'package:test_user_map/data/repositories/user/user_repository.dart';

class ShowUserButton extends StatelessWidget {
  ShowUserButton({
    super.key,
    required this.mapController,
  });
  MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, state) {
        return Positioned(
          bottom: 20,
          right: 140,
          child: SizedBox(
            width: 100,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                mapController.moveAndRotate(
                    LatLng(
                      state.position!.latitude,
                      state.position!.longitude,
                    ),
                    9.4, 0);
              },
              child: const Text('Show User'),
            ),
          ),
        );
      },
    );
  }
}
