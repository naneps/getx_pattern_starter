import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

// ignore: must_be_immutable
class XButton extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;
  bool? isDisabled;
  Color? disabledColor;
  bool? hasIcon;
  IconData? icon;
  XButton({
    super.key,
    this.onPressed,
    this.text,
    this.isDisabled = false,
    this.hasIcon = false,
    this.disabledColor,
    this.icon = Icons.arrow_forward,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled! ? disabledColor : ThemeApp.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      onPressed: isDisabled! ? null : onPressed,
      child: SizedBox(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon!,
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            Visibility(
              visible: hasIcon!,
              child: SizedBox(width: 5),
            ),
            Text(
              text ?? "Button",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDisabled! ? ThemeApp.grayTextColor : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
