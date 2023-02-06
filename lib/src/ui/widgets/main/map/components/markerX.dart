import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_user_map/resources/app_styles.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';

class MarkerX extends Marker {
  MarkerX({required this.userModel})
      : super(
          height: 30,
          width: 30,
          point: LatLng(
            userModel.latitude?.toDouble() ?? 0,
            userModel.longitude?.toDouble() ?? 0,
          ),
          builder: (context) => Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Align(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: DecoratedBox(
                      decoration: AppDecorations.markerX,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        );

  final UserModel userModel;
}
