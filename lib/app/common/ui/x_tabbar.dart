import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';

class XTabBar extends GetView<XTabController> {
  const XTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var tab in controller.tabs)
          Expanded(
            child: InkWell(
              onTap: () {
                for (var element in controller.tabs) {
                  // element.isActive = false;
                }
                // tab.isActive = true;
                controller.update();
              },
              child: RoundedContainer(
                color: tab.isActive ? tab.activeColor : tab.inactiveColor,
                child: Center(
                  child: Text(
                    tab.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class XTabController extends GetxController {
  final RxList tabs = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class XTab {
  final String title;
  final Widget child;
  final bool isActive;
  final Function? onTap;
  final Color? activeColor;
  final Color? inactiveColor;

  XTab({
    required this.title,
    required this.child,
    this.activeColor,
    this.inactiveColor,
    this.onTap,
    this.isActive = false,
  });
}
