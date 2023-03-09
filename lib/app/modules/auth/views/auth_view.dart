import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/buttons/XButton.dart';
import 'package:getx_pattern_starter/app/common/input/XField.dart';
import 'package:getx_pattern_starter/app/routes/app_pages.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 19),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/analytic.png",
                          fit: BoxFit.contain,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Welcome to ",
                            style: TextStyle(
                              color: ThemeApp.darkColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "GetX",
                                style: GoogleFonts.poppins(
                                  color: ThemeApp.primaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: " Starter",
                                style: GoogleFonts.poppins(
                                  color: ThemeApp.darkColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      color: ThemeApp.darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  XTextField(
                    labelText: "Phone",
                    hintText: "+6281xxxx",
                    prefixIcon: MdiIcons.phoneOutline,
                    onSave: (val) {
                      // controller.phone.value = val!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () {
                      return XTextField(
                        labelText: "password",
                        hintText: "pass****123",
                        prefixIcon: MdiIcons.lockOutline,
                        onSave: (val) {
                          controller.password.value = val!;
                        },
                        suffixIcon: controller.isShowPass.value
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        obscureText: !controller.isShowPass.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can't be empty";
                          }
                          if (value.length < 8) {
                            return "Minimum 8 character";
                          }
                          return null;
                        },
                        onPressSuffix: () {
                          controller.isShowPass.value =
                              !controller.isShowPass.value;
                        },
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: ThemeApp.darkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  XButton(
                    text: "Login",
                    hasIcon: true,
                    icon: MdiIcons.login,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // controller.login();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ThemeApp.darkColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: ThemeApp.darkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          color: ThemeApp.darkColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // register
                  XButton(
                    text: "Register",
                    hasIcon: true,
                    icon: MdiIcons.accountPlusOutline,
                    onPressed: () {
                      // controller.register();
                      Get.toNamed(Routes.REGISTER);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
