import 'package:flutter/material.dart';
import 'package:test_user_map/src/theme/app_colors.dart';

abstract class AppStyles {
  static const TextStyle profileTitle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle profileSubtitle = TextStyle(
    fontSize: 18,
    color: Colors.black45,
  );
  static const TextStyle mapUserName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle mapEmail = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );
  static const TextStyle drawerUserName = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle drawerEmail = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );
  static const TextStyle authButton = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.7,
  );
  static ButtonStyle createUserButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(AppColors.bgColor),
  );
}

class AppDecorations {
  static BoxDecoration userMarker = BoxDecoration(
    color: Colors.yellow,
    borderRadius: BorderRadius.circular(50),
    border: Border.all(width: 5, color: Colors.blue),
  );
  static BoxDecoration markerX = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50),
    border: Border.all(
      width: 7,
    ),
  );
  static BoxDecoration infoMapWidget = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.4),
        blurRadius: 8,
        offset: const Offset(0, 5),
      ),
    ],
  );
}
