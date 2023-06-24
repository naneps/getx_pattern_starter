import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        return NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0)
            .format(amount);
    }
  }

  static BorderRadiusGeometry handleRequestRadius({
    double radius = 10,
    RadiusType radiusType = RadiusType.circle,
  }) {
    switch (radiusType) {
      case RadiusType.circle:
        return BorderRadius.circular(10000);

      case RadiusType.oval:
        return BorderRadius.all(Radius.circular(radius));

      case RadiusType.rounded:
        return BorderRadius.circular(radius);

      case RadiusType.onlyTopLeft:
        return BorderRadius.only(topLeft: Radius.circular(radius));

      case RadiusType.onlyTopRight:
        return BorderRadius.only(topRight: Radius.circular(radius));

      case RadiusType.onlyBottomLeft:
        return BorderRadius.only(bottomLeft: Radius.circular(radius));

      case RadiusType.onlyBottomRight:
        return BorderRadius.only(bottomRight: Radius.circular(radius));

      case RadiusType.onlyTop:
        return BorderRadius.vertical(top: Radius.circular(radius));

      case RadiusType.onlyBottom:
        return BorderRadius.vertical(bottom: Radius.circular(radius));

      case RadiusType.onlyLeft:
        return BorderRadius.horizontal(left: Radius.circular(radius));

      case RadiusType.onlyRight:
        return BorderRadius.horizontal(right: Radius.circular(radius));

      case RadiusType.diagonal1:
        return BorderRadius.only(
          topLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        );

      case RadiusType.diagonal2:
        return BorderRadius.only(
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(radius),
        );

      case RadiusType.none:
        return BorderRadius.zero;

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
  static void snackbarLoading() {
    Get.snackbar(
      "Loading",
      "Please wait...",
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        "Loading",
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      // icon: Icon(
      //   MdiIcons.loading,
      //   color: ThemeApp.neutralColor,
      //   size: 35,
      // ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      messageText: Text(
        "Please wait...",
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      showProgressIndicator: true,
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
        ThemeApp.neutralColor,
      ),
      barBlur: 20,
      borderColor: ThemeApp.neutralColor,
      borderWidth: 1,
      borderRadius: 10,
      leftBarIndicatorColor: ThemeApp.neutralColor,
      overlayColor: Colors.black.withOpacity(0.2),
      shouldIconPulse: true,
      colorText: ThemeApp.successColor,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutQuart,
    );
  }

  static void successMessage(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        "Success",
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(
        Icons.check_circle,
        color: ThemeApp.successColor,
        size: 35,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      messageText: Text(
        message,
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      barBlur: 20,
      leftBarIndicatorColor: ThemeApp.successColor,
      overlayColor: Colors.black.withOpacity(0.2),
      shouldIconPulse: true,
      borderColor: ThemeApp.successColor,
      borderWidth: 1,
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      maxWidth: Get.width,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutQuart,
    );
  }

  static void snackMessage({
    required String title,
    required String? messages,
    String? type = "default",
  }) {
    Get.snackbar(
      title,
      messages!,
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        title,
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(
        handleTypeIcon(type!),
        color: handleTypeColor(type),
        size: 35,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      messageText: Text(
        messages,
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      barBlur: 20,
      leftBarIndicatorColor: handleTypeColor(type),
      overlayColor: Colors.black.withOpacity(0.2),
      shouldIconPulse: true,
      borderColor: handleTypeColor(type),
      borderWidth: 1,
      margin: const EdgeInsets.all(8),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      maxWidth: Get.width,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutQuart,
    );
  }

  static Color handleTypeColor(String type) {
    Color? color;
    switch (type.toLowerCase()) {
      case "error":
        color = ThemeApp.errorColor;
        break;
      case "success":
        color = ThemeApp.successColor;
        break;
      case "warning":
        color = ThemeApp.warningColor;
        break;
      default:
        color = ThemeApp.primaryColor;
        break;
    }
    return color;
  }

  static IconData handleTypeIcon(String type) {
    IconData? icon;
    switch (type.toLowerCase()) {
      case "error":
        icon = MdiIcons.closeCircle;
        break;
      case "success":
        icon = MdiIcons.checkCircle;
        break;
      case "warning":
        icon = MdiIcons.alertCircle;
        break;
    }

    return icon!;
  }

  static void errorMessage(String message) {
    Get.snackbar(
      "error",
      message,
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        "error",
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: Icon(
        MdiIcons.closeCircle,
        color: ThemeApp.errorColor,
        size: 35,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      messageText: Text(
        message,
        style: TextStyle(
          color: ThemeApp.neutralColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Colors.white,
      barBlur: 20,
      leftBarIndicatorColor: ThemeApp.errorColor,
      overlayColor: Colors.black.withOpacity(0.2),
      shouldIconPulse: true,
      borderColor: ThemeApp.errorColor,
      borderWidth: 1,
      margin: const EdgeInsets.all(19),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      maxWidth: Get.width,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeInOutBack,
      reverseAnimationCurve: Curves.easeOutQuart,
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
                  const SizedBox(
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
        color: ThemeApp.neutralColor.withOpacity(0.8),
        size: 100,
      ),
    );
  }

  static String dateTimeFormatter(String date) {
    DateTime dateTime = DateTime.parse(date);
    String dayString = '${dateTime.day}'.padLeft(2, '0');
    String monthString = monthFormatter(dateTime.month);
    String yearString = '${dateTime.year}';
    String hourString = '${dateTime.hour}'.padLeft(2, '0');
    String minuteString = '${dateTime.minute}'.padLeft(2, '0');
    String secondString = '${dateTime.second}'.padLeft(2, '0');

    return '$dayString $monthString $yearString $hourString:$minuteString:$secondString';
  }

  static String dMYFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    String dayString = '${dateTime.day}'.padLeft(2, '0');
    String monthString = monthFormatter(dateTime.month);
    String yearString = '${dateTime.year}';

    return '$dayString $monthString $yearString';
  }

  static String yearFormatter(String date) {
    DateTime dateTime = DateTime.parse(date);
    String yearString = '${dateTime.year}';

    return yearString;
  }

  static String timeFormatter(String date) {
    DateTime dateTime = DateTime.parse(date);
    String hourString = '${dateTime.hour}'.padLeft(2, '0');
    String minuteString = '${dateTime.minute}'.padLeft(2, '0');

    return '$hourString:$minuteString';
  }

  static String dayMonthFormatter(String date) {
    DateTime dateTime = DateTime.parse(date);
    String dayString = '${dateTime.day}'.padLeft(2, '0');
    String monthString = monthFormatter(dateTime.month);

    return '$dayString $monthString';
  }

  static String dayMonthTimeFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    String dayString = '${dateTime.day}'.padLeft(2, '0');
    String monthString = monthFormatter(dateTime.month);
    String hourString = '${dateTime.hour}'.padLeft(2, '0');
    String minuteString = '${dateTime.minute}'.padLeft(2, '0');

    return '$dayString $monthString | $hourString:$minuteString';
  }

  static String dateFromNow(String date) {
    final DateTime dateTime = DateTime.parse(date);
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'baru saja';
    } else if (difference.inMinutes < 60) {
      final int minutes = difference.inMinutes;
      return '$minutes menit yang lalu';
    } else if (difference.inHours < 24) {
      final int hours = difference.inHours;
      return '$hours jam yang lalu';
    } else if (difference.inDays < 30) {
      final int days = difference.inDays;
      return '$days hari yang lalu';
    } else if (difference.inDays < 365) {
      final int months = (difference.inDays / 30).floor();
      return '$months bulan yang lalu';
    } else if (difference.inDays > 365) {
      final int years = (difference.inDays / 365).floor();
      return '$years tahun yang lalu';
    } else {
      return dateTimeFormatter(date);
    }
  }

  static String monthFormatter(int month) {
    final monthNames = {
      1: 'Januari',
      2: 'Februari',
      3: 'Maret',
      4: 'April',
      5: 'Mei',
      6: 'Juni',
      7: 'Juli',
      8: 'Agustus',
      9: 'September',
      10: 'Oktober',
      11: 'November',
      12: 'Desember',
    };

    return monthNames[month] ?? 'Januari';
  }

  static void hapticFeedback() {
    HapticFeedback.mediumImpact();
  }

  static void launchURL(String s) {}
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
  none,
  normal
}
