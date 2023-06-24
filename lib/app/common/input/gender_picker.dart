import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GenderPicker extends GetView<GenderPickerController> {
  final Function(String) onSelected;
  final String? initialValue;
  const GenderPicker({
    super.key,
    required this.onSelected,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    initialValue != null
        ? controller.selectedGender.value = initialValue!
        : controller.selectedGender.value = "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Jenis Kelamin",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.genderList.length, (index) {
              bool isSelected = controller.selectedGender.value ==
                  controller.genderList[index].name;
              return _buildBadge(controller.genderList[index], isSelected);
            }),
          );
        }),
      ],
    );
  }

  Widget _buildBadge(GenderModel genderModel, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.selectedGender.value = genderModel.name!;
          onSelected(controller.selectedGender.value);
        },
        child: RoundedContainer(
          padding: EdgeInsets.all(isSelected ? 10 : 5),
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          hasBorder: true,
          color: isSelected ? ThemeApp.primaryColor : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                genderModel.icon,
                color: isSelected ? Colors.white : ThemeApp.neutralColor,
              ),
              const SizedBox(width: 10),
              Text(
                genderModel.name!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : ThemeApp.neutralColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderPickerController extends GetxController {
  RxList<GenderModel> genderList = <GenderModel>[
    GenderModel(
      id: "1",
      name: "Laki-laki",
      icon: MdiIcons.genderMale,
    ),
    GenderModel(
      id: "2",
      name: "Perempuan",
      icon: MdiIcons.genderFemale,
    )
  ].obs;

  RxString selectedGender = "".obs;
  RxBool selected = false.obs;
}

class GenderModel {
  final String? id;
  final String? name;
  final IconData? icon;

  GenderModel({
    this.id,
    this.name,
    this.icon,
  });
}
