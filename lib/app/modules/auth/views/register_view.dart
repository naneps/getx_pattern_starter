import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/input/XField.dart';
import 'package:getx_pattern_starter/app/modules/auth/controllers/auth_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // MAKE COPY WRITER FOR REGISTER
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              XTextField(
                labelText: "Phone",
                prefixIcon: MdiIcons.phoneOutline,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              XTextField(
                labelText: "Name",
                prefixIcon: MdiIcons.accountOutline,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              XTextField(
                labelText: "Password",
                prefixIcon: MdiIcons.lockOutline,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              XTextField(
                labelText: "Confirm Password",
                prefixIcon: MdiIcons.lockOutline,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Confirm Password is required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
