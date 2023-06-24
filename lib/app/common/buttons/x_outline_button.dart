import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class XOutlineButton extends StatelessWidget {
  String? text;
  VoidCallback? onPressed;
  Color? iconColor;
  Color? textColor;
  IconData? icon;
  Color? borderColor;
  bool? hasIcon;
  XOutlineButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
    this.iconColor,
    this.borderColor,
    this.textColor,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: ThemeApp.primaryColor,
        side: BorderSide(
          color: borderColor ?? ThemeApp.primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon!,
              child: Icon(
                icon ?? MdiIcons.login,
                color: iconColor ?? ThemeApp.primaryColor,
                size: 20,
              ),
            ),
            Visibility(
              visible: hasIcon!,
              child: const SizedBox(width: 5),
            ),
            Text(
              text!,
              style: TextStyle(
                color: textColor ?? ThemeApp.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
