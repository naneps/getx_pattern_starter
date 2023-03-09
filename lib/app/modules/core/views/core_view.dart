import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CoreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
