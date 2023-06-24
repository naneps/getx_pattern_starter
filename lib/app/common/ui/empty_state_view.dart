// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/ui/blink_icon.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmptyStateView extends StatelessWidget {
  String? label;
  IconData? icon;
  Color? iconColor;
  EmptyStateView({
    this.label,
    this.icon,
    this.iconColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.3,
      decoration: const BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlinkIcon(
            icon: icon ?? MdiIcons.emoticonSadOutline,
            size: 100,
            color: iconColor ?? ThemeApp.primaryColor.withOpacity(0.5),
          ),
          const SizedBox(height: 10),
          Text(
            label ?? "Tidak ada data",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ThemeApp.darkColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
