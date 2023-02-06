// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_user_map/resources/app_styles.dart';
import 'package:test_user_map/src/ui/widgets/main/map/components/info_card_widget.dart';

class UserMarker extends StatefulWidget {
  UserMarker({
    super.key,
    required this.infoVisible,
  });

  bool infoVisible;
  @override
  State<UserMarker> createState() => _UserMarkerState();
}

class _UserMarkerState extends State<UserMarker> {
  @override
  Widget build(BuildContext context) {
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
              visible: widget.infoVisible,
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
              if (widget.infoVisible == false) {
                widget.infoVisible = true;
              } else {
                widget.infoVisible = false;
              }
            });
          },
          child: Align(
            child: SizedBox(
              width: 30,
              height: 30,
              child: DecoratedBox(
                decoration: AppDecorations.userMarker,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
