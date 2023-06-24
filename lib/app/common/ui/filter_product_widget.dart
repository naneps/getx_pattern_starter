import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/shape/rounded_container.dart';
import 'package:getx_pattern_starter/app/themes/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilterProductWidget extends GetView<FilterProductController> {
  const FilterProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      width: Get.width,
      hasShadow: false,
      color: Colors.transparent,
      height: 40,
      child: Obx(() {
        return ListView.separated(
          itemCount: controller.filterProducts.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemBuilder: (context, index) {
            Rx<FilterProduct> filterProduct =
                controller.filterProducts[index].obs;
            final RxBool isActive = filterProduct.value.slug ==
                    controller.selectedFilterProduct.value.slug
                ? true.obs
                : false.obs;
            return InkWell(
              onTap: () {
                controller.selectedFilterProduct.value = filterProduct.value;
              },
              child: Obx(() {
                return RoundedContainer(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 10 : 0,
                    right: index == 4 ? 10 : 0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  color: controller.selectedFilterProduct.value.slug ==
                          filterProduct.value.slug
                      ? ThemeApp.neutralColor
                      : Colors.transparent,
                  hasBorder: true,
                  hasShadow: false,
                  child: Row(
                    children: [
                      Icon(
                        filterProduct.value.icon,
                        color: controller.selectedFilterProduct.value.slug ==
                                filterProduct.value.slug
                            ? Colors.white
                            : ThemeApp.neutralColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        filterProduct.value.name,
                        style: TextStyle(
                          color: controller.selectedFilterProduct.value.slug ==
                                  filterProduct.value.slug
                              ? Colors.white
                              : ThemeApp.neutralColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        );
      }),
    );
  }
}

class FilterProductController extends GetxController {
  RxList<FilterProduct> filterProducts = <FilterProduct>[].obs;
  Rx<FilterProduct> selectedFilterProduct = FilterProduct(
    name: "Semua",
    slug: "all",
    icon: MdiIcons.viewGrid,
  ).obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    filterProducts.addAll([
      FilterProduct(
        name: "Semua",
        slug: "all",
        icon: MdiIcons.viewGrid,
      ),
      FilterProduct(
        name: "Favoritku",
        slug: 'favorite',
        icon: MdiIcons.heart,
      ),
      FilterProduct(
        name: 'Produk Terbaru',
        slug: 'new product',
        icon: MdiIcons.newBox,
      ),
      FilterProduct(
        name: 'Produk Terlaris',
        slug: 'best seller',
        icon: MdiIcons.trendingUp,
      ),
      FilterProduct(
        name: 'Produk Diskon',
        slug: 'discount',
        icon: MdiIcons.sale,
      ),
      FilterProduct(
        name: 'Produk Terpopuler',
        slug: 'popular',
        icon: MdiIcons.fire,
      ),
    ]);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class FilterProduct {
  final String name;
  IconData? icon;
  String? iconUrl;
  final String slug;

  FilterProduct({
    required this.name,
    required this.slug,
    this.icon,
    this.iconUrl,
  });
}
