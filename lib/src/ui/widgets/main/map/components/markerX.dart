import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_user_map/src/domain/models/user_model.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/info_card_widget.dart';

class MarkerX extends Marker {
  MarkerX({required this.userModel})
      : super(
          height: 30,
          width: 30,
          point: LatLng(
            userModel.latitude!.toDouble(),
            userModel.longitude!.toDouble(),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 7,
                        ),
                      ),
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
