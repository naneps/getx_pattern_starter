import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Middleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // if (Get.find<AuthController>().isAuth.value) {
    //   return RouteSettings(name: '/home');
    // }
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    // if (Get.find<AuthController>().isAuth.value) {
    //   return GetPage(name: '/home', page: () => HomeView());
    // }
    return page;
  }

  @override
  Future<bool> onPageCalledFilter(String? page) async {
    // if (Get.find<AuthController>().isAuth.value) {
    //   return false;
    // }
    return true;
  }
}
