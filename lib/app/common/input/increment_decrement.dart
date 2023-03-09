// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/buttons/XIconButton.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IncDecWidget extends StatefulWidget {
  Function(int?)? onChange;
  int? maxValue;
  double? sizeField;
  double? iconSize;
  double? fontSize;
  int? minValue;
  Color? backgroundColor;
  int? initialValue;
  bool? isDisabled;
  double? width;

  IncDecWidget({
    Key? key,
    this.onChange,
    this.maxValue = 100,
    this.iconSize = 15,
    this.sizeField = 30,
    this.fontSize = 12,
    this.minValue,
    this.initialValue,
    this.backgroundColor = Colors.transparent,
    this.width = 120,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<IncDecWidget> createState() => _IncDecWidgetState();
}

class _IncDecWidgetState extends State<IncDecWidget> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    if (widget.initialValue != null) {
      _counter = widget.initialValue!;
    }
    _controller.text = _counter.toString();
    _controller.addListener(() {
      widget.onChange!(int.parse(_controller.text));
      if (_controller.text.characters.isEmpty) {
        setState(() {
          _counter = 0;
          _controller.text = _counter.toString();
        });
      }
      if (int.parse(_controller.text) > widget.maxValue!) {
        setState(() {
          _counter = widget.maxValue!;
          _controller.text = _counter.toString();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Maksimal ${widget.maxValue}'),
          ),
        );
      }
      if (int.parse(_controller.text) < widget.minValue! &&
          widget.minValue != null) {
        setState(() {
          _counter = widget.minValue!;
          _controller.text = _counter.toString();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Minimal ${widget.minValue}'),
          ),
        );
      }
      if (_controller.text.isEmpty) {
        setState(() {
          _counter = int.parse(_controller.text);
          _counter = 0;
          widget.onChange!(_counter);
        });
      }
      _watchCounter();
      _handleIsNotNumber();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // watch counter cannot be negative value
  void _watchCounter() {
    if (_counter < 0) {
      setState(() {
        _counter = 0;
        _controller.text = _counter.toString();
      });
    }
    //
    if (_counter > widget.maxValue!) {
      // show toast

      setState(() {
        _counter = widget.maxValue!;
        _controller.text = _counter.toString();
      });
    }
  }

  void _handleIsNotNumber() {
    // Invalid radix-10 number (at character 1) handle is not number
    //  try catch numberformat exception
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          XIconButton(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(5),
            icon: MdiIcons.minus,
            size: widget.iconSize,
            color: ThemeApp.dangerColor,
            supportColor: ThemeApp.dangerColor,
            onTap: () {
              setState(() {
                _counter--;
                _controller.text = _counter.toString();
                _watchCounter();
              });
            },
          ),
          Container(
            alignment: Alignment.center,
            width: widget.sizeField,
            height: widget.sizeField,
            child: Center(
              child: TextField(
                enabled: !widget.isDisabled!,
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    _counter = int.parse(value);
                    widget.onChange!(_counter);
                  });
                },
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeApp.darkColor,
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  isCollapsed: true,
                  focusedBorder: InputBorder.none,
                ),
                cursorColor: ThemeApp.primaryColor,
              ),
            ),
          ),
          XIconButton(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(5),
            icon: MdiIcons.plus,
            size: widget.iconSize,
            color: widget.isDisabled! ? Colors.grey : ThemeApp.successColor,
            supportColor:
                widget.isDisabled! ? Colors.grey : ThemeApp.successColor,
            onTap: () {
              if (widget.isDisabled!) {
                return;
              }
              setState(
                () {
                  _counter++;
                  _controller.text = _counter.toString();
                  _watchCounter();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
