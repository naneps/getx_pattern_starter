import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/common/ui/blink_icon.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

class ErrorStateView extends StatelessWidget {
  const ErrorStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedContainer(
            width: 100,
            height: 100,
            radius: 50,
            color: ThemeApp.warningColor.withOpacity(0.2),
            child: BlinkIcon(
              icon: Icons.error,
              color: ThemeApp.warningColor.withOpacity(0.8),
              size: 100,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Mohon maaf, terjadi kesalahan pada sistem ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeApp.darkColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
