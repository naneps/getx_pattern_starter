import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Utils {
  Utils._();
  static String imageToBase64(File file) {
    return base64Encode(file.readAsBytesSync());
  }

  static String getFormattedDate(String date) {
    final DateTime dateTime = DateTime.parse(date);

    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String getFormattedTime(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  static String formatCurrency(double amount, {String? locale}) {
    // check locale
    switch (locale) {
      case "vi":
        return NumberFormat.currency(locale: 'vi', symbol: 'đ').format(amount);
      case "id":
        return NumberFormat.currency(
                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
            .format(amount);
      case "en":
        return NumberFormat.currency(locale: 'en', symbol: '\$').format(amount);
      case "th":
        return NumberFormat.currency(locale: 'th', symbol: '฿').format(amount);
      default:
        return NumberFormat.currency(locale: 'en', symbol: '\$').format(amount);
    }
  }

  static BorderRadiusGeometry handleRequestRadius({
    double radius = 10,
    RadiusType radiusType = RadiusType.circle,
  }) {
    switch (radiusType) {
      case RadiusType.circle:
        return BorderRadius.circular(MediaQuery.of(Get.context!).size.width);
      case RadiusType.oval:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      case RadiusType.onlyTopLeft:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: const Radius.circular(0),
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        );
      case RadiusType.onlyTopRight:
        return BorderRadius.only(
          topLeft: const Radius.circular(0),
          topRight: Radius.circular(radius),
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        );
      case RadiusType.onlyBottomLeft:
        return BorderRadius.only(
          topLeft: const Radius.circular(0),
          topRight: const Radius.circular(0),
          bottomLeft: Radius.circular(radius),
          bottomRight: const Radius.circular(0),
        );
      case RadiusType.onlyBottomRight:
        return BorderRadius.only(
          topLeft: const Radius.circular(0),
          topRight: const Radius.circular(0),
          bottomLeft: const Radius.circular(0),
          bottomRight: Radius.circular(radius),
        );
      case RadiusType.onlyTop:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: const Radius.circular(0),
          bottomRight: const Radius.circular(0),
        );
      case RadiusType.onlyBottom:
        return BorderRadius.only(
          topLeft: const Radius.circular(0),
          topRight: const Radius.circular(0),
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );
      case RadiusType.onlyLeft:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: const Radius.circular(0),
          bottomLeft: Radius.circular(radius),
          bottomRight: const Radius.circular(0),
        );
      case RadiusType.onlyRight:
        return BorderRadius.only(
          topLeft: const Radius.circular(0),
          topRight: Radius.circular(radius),
          bottomLeft: const Radius.circular(0),
          bottomRight: Radius.circular(radius),
        );
      default:
        return BorderRadius.circular(radius);
    }
  }

  // static successMessage(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Positioned(
  //         top: 0,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: ThemeApp.successColor,
  //             borderRadius: BorderRadius.circular(10),
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomRight,
  //               colors: [
  //                 ThemeApp.successColor,
  //                 ThemeApp.successColor.withOpacity(0.7),
  //                 ThemeApp.successColor,
  //                 ThemeApp.successColor.withOpacity(0.5),
  //                 ThemeApp.successColor.withOpacity(0.3),
  //               ],
  //             ),
  //           ),
  //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //           child: ListTile(
  //             contentPadding: EdgeInsets.zero,
  //             leading: const Icon(
  //               MdiIcons.checkCircle,
  //               color: Colors.white,
  //               size: 30,
  //             ),
  //             title: const Text(
  //               "Berhasil",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             trailing: IconButton(
  //               icon: const Icon(
  //                 MdiIcons.close,
  //                 color: Colors.white,
  //               ),
  //               onPressed: () {
  //                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //               },
  //             ),
  //             subtitle:
  //                 Text(message, style: const TextStyle(color: Colors.white)),
  //           ),
  //         ),
  //       ),
  //       elevation: 0,
  //       backgroundColor: Colors.transparent,
  //     ),
  //   );
  // }
  static void successMessage(String message) {
    Get.snackbar(
      'Berhasil',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeApp.successColor,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeInOutBack,
      titleText: const Text(
        'Berhasil',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorText: ThemeApp.darkColor,
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        MdiIcons.alertCircle,
        color: Colors.white,
        size: 40,
      ),
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundGradient: LinearGradient(
        colors: [
          ThemeApp.successColor.withOpacity(0.8),
          ThemeApp.successColor,
          ThemeApp.successColor.withOpacity(0.5),
        ],
      ),
      barBlur: 100,
    );
  }

  static void errorMessage(String message) {
    Get.snackbar(
      'Gagal',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: ThemeApp.dangerColor,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeInOutBack,
      titleText: const Text(
        'Gagal',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      colorText: ThemeApp.darkColor,
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      icon: const Icon(
        MdiIcons.alertCircle,
        color: Colors.white,
        size: 40,
      ),
      animationDuration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      backgroundGradient: LinearGradient(
        colors: [
          ThemeApp.dangerColor.withOpacity(0.8),
          ThemeApp.dangerColor,
          ThemeApp.dangerColor.withOpacity(0.5),
        ],
      ),
      barBlur: 100,
    );
  }

  static Future<void> loadingDialog() async {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: handleRequestRadius(radiusType: RadiusType.rounded),
          ),
          child: Center(
            child: LoadingAnimationWidget.flickr(
              leftDotColor: ThemeApp.primaryColor,
              rightDotColor: ThemeApp.lightColor,
              size: 30,
            ),
          ),
        ),
      ),
      transitionCurve: Curves.easeInOut,
    );
  }

  static void confirmDialog(
      {String? title,
      String? message,
      Function? onConfirm,
      String? confirmText,
      String? cancelText}) {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      title: '',
      content: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: handleRequestRadius(radiusType: RadiusType.rounded),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: Get.width,
                height: 10,
                color: ThemeApp.warningColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title ?? 'Konfirmasi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ThemeApp.darkColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message ?? 'Apakah anda yakin?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: ThemeApp.darkColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          closeDialog();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          side: BorderSide(
                            color: ThemeApp.darkColor,
                          ),
                        ),
                        child: Text(
                          cancelText ?? 'Tidak',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeApp.darkColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          side: BorderSide(
                            color: ThemeApp.dangerColor,
                          ),
                        ),
                        child: Text(
                          confirmText ?? 'Ya',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ThemeApp.dangerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void closeDialog() {
    Get.back();
  }

  static Widget loadingWidget() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: ThemeApp.primaryColor.withOpacity(0.8),
        size: 100,
      ),
    );
  }

  static String dateFormatter(String date) {
    // make like 01 Januari 2021 12:00:00
    DateTime dateTime = DateTime.parse(date);
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int second = dateTime.second;
    String dayString = day.toString();
    String monthString = monthFormatter(month);
    String yearString = year.toString();
    String hourString = hour.toString();
    String minuteString = minute.toString();
    String secondString = second.toString();
    if (day < 10) {
      dayString = '0$day';
    }
    if (month < 10) {
      monthString = '0$month';
    }
    if (hour < 10) {
      hourString = '0$hour';
    }
    if (minute < 10) {
      minuteString = '0$minute';
    }
    if (second < 10) {
      secondString = '0$second';
    }
    return '$dayString-$monthString-$yearString | $hourString:$minuteString:$secondString';
  }

  static String monthFormatter(int month) {
    // if month is 1, return Januari make like this
    String monthName = '';
    switch (month) {
      case 1:
        monthName = 'Januari';
        break;
      case 2:
        monthName = 'Februari';
        break;
      case 3:
        monthName = 'Maret';
        break;
      case 4:
        monthName = 'April';
        break;
      case 5:
        monthName = 'Mei';
        break;
      case 6:
        monthName = 'Juni';
        break;
      case 7:
        monthName = 'Juli';
        break;
      case 8:
        monthName = 'Agustus';
        break;
      case 9:
        monthName = 'September';
        break;
      case 10:
        monthName = 'Oktober';
        break;
      case 11:
        monthName = 'November';
        break;
      case 12:
        monthName = 'Desember';
        break;
      default:
        monthName = 'Januari';
    }
    return monthName;
  }
}

enum RadiusType {
  rounded,
  circle,
  oval,
  onlyTopLeft,
  onlyTopRight,
  onlyBottomLeft,
  onlyBottomRight,
  onlyTop,
  onlyBottom,
  onlyLeft,
  onlyRight,
  diagonal1,
  diagonal2,
  none
}
