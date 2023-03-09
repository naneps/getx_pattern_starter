import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:flutter/material.dart';

class XTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final bool? disabled;

  final IconData? icon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Function? onTap;
  final Function? onSubmitted;
  final Function(String?)? onSave;
  // final Function? onEditingComplete;
  final dynamic validator;
  final dynamic onPressSuffix;

  const XTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.obscureText,
      this.icon,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.onSubmitted,
      this.labelText,
      this.maxLines,
      this.minLines,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.onPressSuffix,
      this.initialValue,
      this.disabled,
      this.onSave});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(
        color: ThemeApp.darkColor,
      ),
      initialValue: initialValue,
      enableSuggestions: true,
      onSaved: onSave,
      controller: controller,
      enabled: disabled == true ? false : true,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,

        suffixIcon: IconButton(
          onPressed: onPressSuffix,
          icon: Icon(
            suffixIcon,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        // labelText: "Deskripsi Di Sini Yaa",
        hintText: hintText,
        labelText: labelText,
      ),
      keyboardType: keyboardType,
    );
  }
}
