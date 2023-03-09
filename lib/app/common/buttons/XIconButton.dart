import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

// ignore: must_be_immutable
class XIconButton extends StatelessWidget {
  Color? color;
  Color? supportColor;
  Color? shadowColor;
  String? tooltip;
  EdgeInsets? margin;
  EdgeInsets? padding;
  IconData icon;
  double? size;
  Color? backgroundColor;
  VoidCallback? onTap;
  VoidCallback? onLongPress;
  XIconButton({
    this.color,
    this.supportColor = Colors.black,
    this.shadowColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.onTap,
    this.onLongPress,
    this.size,
    this.margin,
    this.tooltip,
    this.padding,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: supportColor!.withOpacity(0.3),
      highlightColor: supportColor!.withOpacity(0.1),
      onHover: (value) {},
      excludeFromSemantics: true,
      onTap: onTap,
      onLongPress: onLongPress,
      child: Tooltip(
        message: tooltip ?? "",
        triggerMode: TooltipTriggerMode.longPress,
        showDuration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          color: ThemeApp.darkColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: margin ?? const EdgeInsets.all(5),
          padding: padding ?? EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            border: Border.all(
              color: supportColor!.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor!.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 48,
                offset: const Offset(0, 28), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            icon,
            color: color ?? ThemeApp.darkColor,
            size: size ?? 30,
          ),
        ),
      ),
    );
  }
}
