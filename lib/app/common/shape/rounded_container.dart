import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/common/utils.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';

// ignore: must_be_immutable
class RoundedContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  double? width;
  double? height;
  EdgeInsets? padding;
  EdgeInsets? margin;
  bool? hasBorder;
  bool? hasShadow;
  int? radius;
  RadiusType? radiusType;
  double? borderWidth;
  Color? borderColor;
  Gradient? gradient;
  BoxConstraints? constraints;

  RoundedContainer({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.hasBorder = false,
    this.radius = 10,
    this.gradient,
    this.hasShadow = false,
    this.borderWidth = 1,
    this.borderColor,
    this.radiusType = RadiusType.rounded,
    this.constraints,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.all(0),
      width: width,
      height: height,
      constraints: constraints,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: Utils.handleRequestRadius(
            radius: radius!.toDouble(),
            radiusType: radiusType!,
          ),
          border: hasBorder!
              ? Border.all(
                  color: borderColor ?? ThemeApp.darkColor.withOpacity(0.1),
                  width: borderWidth!,
                  strokeAlign: BorderSide.strokeAlignInside,
                )
              : null,
          boxShadow: hasShadow!
              ? [
                  BoxShadow(
                    color: ThemeApp.darkColor.withOpacity(0.2),
                    blurRadius: 40,
                    offset: const Offset(0, 10), // changes position of shadow
                  ),
                ]
              : null,
          gradient: gradient),
      duration: const Duration(milliseconds: 300),
      child: child ?? const SizedBox(),
    );
  }
}
