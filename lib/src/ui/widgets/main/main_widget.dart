import 'package:flutter/material.dart';
import 'package:test_user_map/resources/app_strings.dart';
import 'package:test_user_map/src/theme/app_colors.dart';
import 'package:test_user_map/src/ui/widgets/main/components/nav_drawer.dart';
import 'package:test_user_map/src/ui/widgets/main/map/map_widget.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(MainAppStrings.mainAppBar),
        backgroundColor: AppColors.bgColor,
      ),
      body: const MapWidget(),
    );
  }
}
