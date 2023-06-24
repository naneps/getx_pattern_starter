import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/common/utils.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

class XBadge extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color? textColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? hasBorder;
  final bool? hasShadow;
  final int? radius;
  final RadiusType? radiusType;
  final double? borderWidth;
  final Color? borderColor;
  final Gradient? gradient;
  final XBadgeType? type;
  const XBadge({
    super.key,
    this.child,
    this.text,
    this.textColor,
    this.padding,
    this.margin,
    this.type = XBadgeType.primary,
    this.hasBorder = false,
    this.radius = 10,
    this.gradient,
    this.hasShadow = false,
    this.borderWidth = 1,
    this.borderColor,
    this.radiusType = RadiusType.rounded,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.all(0),
      color: _handleColor(type!),
      radius: radius,
      radiusType: radiusType,
      gradient: gradient,
      hasBorder: hasBorder,
      hasShadow: hasShadow,
      borderWidth: borderWidth,
      borderColor: borderColor,
      child: child ??
          Text(
            text!,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
    );
  }

  Color? _handleColor(XBadgeType type) {
    switch (type) {
      case XBadgeType.primary:
        return ThemeApp.primaryColor;
      case XBadgeType.secondary:
        return ThemeApp.secondaryColor;
      case XBadgeType.success:
        return ThemeApp.successColor;
      case XBadgeType.danger:
        return ThemeApp.dangerColor;
      case XBadgeType.warning:
        return ThemeApp.warningColor;
      case XBadgeType.info:
        return ThemeApp.infoColor;
      case XBadgeType.light:
        return ThemeApp.lightColor;
      case XBadgeType.dark:
        return ThemeApp.darkColor;
      case XBadgeType.link:
    }
  }
}

enum XBadgeType {
  primary,
  secondary,
  success,
  danger,
  warning,
  info,
  light,
  dark,
  link,
}
