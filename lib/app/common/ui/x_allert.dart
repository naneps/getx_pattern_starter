import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class XAlert extends StatefulWidget {
  final String messages;
  final bool autoHide;
  final bool canDismiss;
  final bool showCloseButton;
  final double durationMillisecond;
  final double fontSize;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderWidth;
  final double? width;

  final TextStyle textStyle;
  const XAlert({
    super.key,
    required this.messages,
    this.autoHide = false,
    this.showCloseButton = false,
    this.canDismiss = false,
    this.width,
    this.durationMillisecond = 3000,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    this.padding = const EdgeInsets.all(15),
    this.backgroundColor,
    this.fontSize = 12,
    this.textColor,
    this.borderWidth = 1,
    this.textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  });

  @override
  State<XAlert> createState() => _XAlertState();
}

class _XAlertState extends State<XAlert> {
  bool visible = true;
  String? messages;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Visibility(
        visible: visible,
        child: Slidable(
          enabled: widget.canDismiss,
          key: const ValueKey('x-alert'),
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  _toggleVisible();
                },
              ),
              children: const []),
          child: Stack(
            children: [
              RoundedContainer(
                hasBorder: true,
                borderWidth: widget.borderWidth,
                color: widget.backgroundColor ?? Colors.white,
                borderColor: ThemeApp.primaryColor,
                padding: widget.padding,
                width: widget.width,
                margin: widget.margin,
                child: Text(
                  widget.messages,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: widget.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Visibility(
                visible: widget.showCloseButton,
                child: Positioned(
                  top: 12,
                  right: 12,
                  child: InkWell(
                    onTap: () {
                      _toggleVisible();
                    },
                    child: Icon(
                      MdiIcons.closeCircleOutline,
                      color: ThemeApp.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    handleAutoHide();
    setState(() {
      messages = widget.messages;
    });
  }

  void _toggleVisible() {
    setState(() {
      visible = !visible;
    });
  }

  void handleAutoHide() async {
    if (widget.autoHide) {
      await Future.delayed(
        Duration(milliseconds: widget.durationMillisecond.toInt()),
      );
      _toggleVisible();
    }
  }
}
