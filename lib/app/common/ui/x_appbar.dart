import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/buttons/x_Icon_button.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class XAppBar extends StatelessWidget {
  IconData leftIcon;
  String title;
  IconData rightIcon;
  bool? hasRightIcon;
  VoidCallback? onTapRightIcon;
  XAppBar({
    super.key,
    this.title = "Title",
    this.hasRightIcon = false,
    this.rightIcon = MdiIcons.dotsVertical,
    this.leftIcon = MdiIcons.arrowLeft,
    this.onTapRightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          XIconButton(
            icon: leftIcon,
            supportColor: ThemeApp.neutralColor.withOpacity(0.2),
            color: ThemeApp.neutralColor,
            hasShadow: false,
            onTap: () {
              Get.back();
            },
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              color: ThemeApp.neutralColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: !hasRightIcon!,
            child: const Spacer(
              flex: 1,
            ),
          ),
          Visibility(
            visible: hasRightIcon!,
            child: XIconButton(
              icon: rightIcon,
              supportColor: ThemeApp.neutralColor.withOpacity(0.2),
              color: ThemeApp.neutralColor,
              hasShadow: false,
              onTap: onTapRightIcon,
            ),
          ),
        ],
      ),
    );
  }
}
