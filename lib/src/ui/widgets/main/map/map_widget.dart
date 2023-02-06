import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/data/repositories/geolocation/geolocation_repository.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/create_user_but.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/markerX.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/show_user_but.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/user_marker.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static const _latKiev = 50.4547;
  static const _lonKiev = 30.5238;
  MapController mapController = MapController();
  Stream<Position> geolocationRepository =
      GeolocationRepository().getPosition();
  bool infoVisible = false;
  late StreamSubscription<Position> homeTabPostionStream;
  Position? position;

  @override
  void initState() {
    BlocProvider.of<GeolocationBloc>(context).add(const GetData());

    homeTabPostionStream = geolocationRepository.listen((event) {
      setState(() {
        position = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    homeTabPostionStream.cancel();
    super.dispose();
  }

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
          return Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  center: LatLng(
                    position?.latitude ?? _latKiev,
                    position?.longitude ?? _lonKiev,
                  ),
                  zoom: 9.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: state.userModel
                        .map((e) => MarkerX(userModel: e))
                        .toList(),
                  ),
                  MarkerLayer(
                    rotate: true,
                    markers: [
                      Marker(
                        width: 300,
                        height: 200,
                        point: LatLng(
                          position?.latitude ?? _latKiev,
                          position?.longitude ?? _lonKiev,
                        ),
                        builder: (context) {
                          return UserMarker(
                            infoVisible: infoVisible,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const CreateUserButton(),
              ShowUserButton(
                mapController: mapController,
                position: position,
              ),
            ],
          );
        }
      },
    );
  }
}
