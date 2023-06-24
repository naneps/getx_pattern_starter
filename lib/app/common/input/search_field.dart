import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: must_be_immutable
class SearchField extends StatefulWidget {
  Function(String)? onChanged;

  String? hintText;
  SearchField({
    Key? key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: ThemeApp.backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              onChanged: widget.onChanged,
              style: TextStyle(
                color: ThemeApp.darkColor,
                fontSize: 14,
              ),
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.hintText ?? 'Pencarian',
                hintStyle: TextStyle(
                  color: ThemeApp.darkColor.withOpacity(0.5),
                  fontSize: 14,
                ),
                suffixIcon: Visibility(
                  visible: _showClear,
                  child: InkWell(
                    onTap: () => _clearText(),
                    child: Icon(
                      MdiIcons.close,
                      color: ThemeApp.darkColor.withOpacity(0.5),
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeApp.darkColor.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: ThemeApp.neutralColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    // watch controller text when not empty show clear button
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        setState(() {
          _showClear = true;
        });
      } else {
        setState(() {
          _showClear = false;
        });
      }
    });
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged!("");
  }
}
