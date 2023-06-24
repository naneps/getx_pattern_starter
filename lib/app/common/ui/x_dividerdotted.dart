import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

class XDividerDotted extends StatelessWidget {
  final EdgeInsets margin;
  final Widget? child;
  final Color? color;
  const XDividerDotted({
    super.key,
    this.child,
    this.margin = const EdgeInsets.all(0),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: margin,
      child: DottedBorder(
        borderType: BorderType.RRect,
        padding: const EdgeInsets.all(0),
        borderPadding: const EdgeInsets.all(0),
        strokeWidth: 1,
        strokeCap: StrokeCap.round,
        dashPattern: const [7, 8],
        color: color ?? ThemeApp.neutralColor.withOpacity(0.2),
        child: SizedBox(
          height: child != null ? null : 1,
          width: Get.width,
          child: child,
        ),
      ),
    );
  }
}
