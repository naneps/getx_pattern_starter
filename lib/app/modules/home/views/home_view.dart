import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentation'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          controller.locationData.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.determinePosition().then((value) {
            // print(value)
            // print all data
          });
        },
        child: const Icon(
          MdiIcons.locationEnter,
        ),
      ),
    );
  }
}
