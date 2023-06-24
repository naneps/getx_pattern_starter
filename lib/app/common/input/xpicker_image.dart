import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/common/utils.dart';
import 'package:getx_pattern_starter/app/services/imgae_picker_services.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: must_be_immutable
class XPickerImage extends GetView<PickerController> {
  Function(XFile) onImagePicked;
  String? networkImage;
  RadiusType? radiusType;
  double? radius;
  double? size;
  EdgeInsets? padding;
  EdgeInsets? margin;
  XPickerImage({
    this.networkImage,
    required this.onImagePicked,
    required this.size,
    this.radiusType = RadiusType.rounded,
    this.padding,
    this.margin = const EdgeInsets.all(0),
    this.radius = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: size! + 30,
      width: size! + 30,
      hasBorder: true,

      margin: margin,
      // color: Colors.amber,
      child: InkWell(
        onTap: () {
          showPicker();
        },
        onLongPress: () {
          showDetail();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            controller.obx(
              (state) {
                return Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: Image.file(File(state.path)).image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: Utils.handleRequestRadius(
                      radiusType: radiusType!,
                      radius: radius!,
                    ),
                    border: Border.all(
                      color: ThemeApp.grayColor.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                );
              },
              onEmpty: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  borderRadius: Utils.handleRequestRadius(
                    radiusType: radiusType!,
                    radius: radius!,
                  ),
                  image: networkImage != null
                      ? DecorationImage(
                          image: NetworkImage(networkImage ?? ''),
                          fit: BoxFit.cover,
                        )
                      : const DecorationImage(
                          image: AssetImage('assets/images/placeholder.jpg'),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: RoundedContainer(
                hasBorder: true,
                width: 40,
                height: 40,
                radiusType: RadiusType.circle,
                hasShadow: true,
                child: Icon(MdiIcons.camera, color: ThemeApp.darkColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showDetail() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          color: Colors.transparent,
          height: Get.height,
          width: Get.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // close button in top right corner

              SizedBox(
                width: Get.width,
                child: controller.obx(
                  (state) {
                    return networkImage != null
                        ? Image.network(
                            networkImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(state.path),
                            fit: BoxFit.fill,
                          );
                  },
                  onEmpty: Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                      borderRadius: Utils.handleRequestRadius(
                        radiusType: RadiusType.rounded,
                      ),
                      color: Colors.grey[300],
                      image: networkImage != null
                          ? DecorationImage(
                              image: NetworkImage(networkImage!),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image:
                                  AssetImage('assets/images/placeholder.jpg'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(
                    MdiIcons.closeCircle,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPicker() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        height: 150,
        child: Column(
          children: [
            RoundedContainer(
              width: Get.width,
              height: 50,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: const Icon(MdiIcons.camera),
                title: Text(
                  'Pilih Dari Kamera',
                  style: TextStyle(
                    color: ThemeApp.darkColor,
                  ),
                ),
                onTap: () {
                  controller.pickImageFromCamera().then((value) {
                    onImagePicked(value);
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            RoundedContainer(
              width: Get.width,
              height: 50,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                leading: const Icon(MdiIcons.image),
                title: Text(
                  'Pilih Dari Galeri',
                  style: TextStyle(
                    color: ThemeApp.darkColor,
                  ),
                ),
                onTap: () {
                  controller.pickImageFromGallery().then((value) {
                    onImagePicked(value);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PickerController extends GetxController with StateMixin {
  Rx<XFile> image = XFile('').obs;
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  Future<XFile> pickImageFromGallery() async {
    final pickedFile =
        await Get.find<ImagePickerService>().pickImageFromGallery();
    change(pickedFile, status: RxStatus.loading());
    if (pickedFile != null) {
      change(pickedFile, status: RxStatus.success());
      image.value = pickedFile;
      Get.back();
    }
    return image.value;
  }

  Future<XFile> pickImageFromCamera() async {
    final pickedFile =
        await Get.find<ImagePickerService>().pickImageFromCamera();
    if (pickedFile.path.isNotEmpty) {
      change(pickedFile, status: RxStatus.loading());
      change(pickedFile, status: RxStatus.success());
      image.value = pickedFile;
      Get.back();
    }
    return image.value;
  }
}
