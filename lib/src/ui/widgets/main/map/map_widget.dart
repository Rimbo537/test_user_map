import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_user_map/core/bloc_geolocation/bloc/geolocation_bloc.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/create_user_but.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/info_card_widget.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/markerX.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/show_user_but.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  static const _latKiev = 50.4547;
  static const _lonKiev = 30.5238;
  final MapController mapController = MapController();
  bool infoVisible = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GeolocationBloc>(context).add(const GetData());
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
                    state.position?.latitude ?? _latKiev,
                    state.position?.longitude ?? _lonKiev,
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
                    rotate: true,
                    markers: [
                      Marker(
                        width: 300,
                        height: 200,
                        point: LatLng(
                          state.position?.latitude ?? _latKiev,
                          state.position?.longitude ?? _lonKiev,
                        ),
                        builder: (context) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 150,
                                  height: 70,
                                  child: Visibility(
                                    visible: infoVisible,
                                    child: const InfoCardWidget(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (infoVisible == false) {
                                      infoVisible = true;
                                    } else {
                                      infoVisible = false;
                                    }
                                  });
                                },
                                child: Align(
                                  child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            width: 5, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: state.userModel
                        .map((e) => MarkerX(userModel: e))
                        .toList(),
                  ),
                ],
              ),
              const CreateUserButton(),
              ShowUserButton(mapController: mapController),
            ],
          );
        }
      },
    );
  }
}
