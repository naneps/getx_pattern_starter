import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_starter/app/common/utils.dart';

class XPicture extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final double? sizeWidth;
  final double? sizeHeight;
  final double radius;
  final RadiusType radiusType;
  final String assetImage;

  const XPicture({
    Key? key,
    required this.imageUrl,
    this.size = 100,
    this.sizeWidth,
    this.sizeHeight,
    this.radius = 10,
    this.radiusType = RadiusType.rounded,
    this.assetImage = "assets/images/placeholder.jpg",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: showDetail,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        progressIndicatorBuilder: (context, url, progress) {
          //make shimmer and adjust with border radius
          return Container(
            width: sizeWidth ?? size,
            height: sizeHeight ?? size,
            decoration: BoxDecoration(
              borderRadius: Utils.handleRequestRadius(
                  radius: radius, radiusType: radiusType),
              color: Colors.grey[300],
            ),
          );
        },
        imageBuilder: (context, imageProvider) => Container(
          width: sizeWidth ?? size,
          height: sizeHeight ?? size,
          decoration: BoxDecoration(
            borderRadius: Utils.handleRequestRadius(
                radius: radius, radiusType: radiusType),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // placeholder: (context, url) => Container(
        //   width: sizeWidth ?? size,
        //   height: sizeHeight ?? size,
        //   decoration: BoxDecoration(
        //     borderRadius: Utils.handleRequestRadius(radiusType: radiusType),
        //     color: Colors.grey[300],
        //     image: DecorationImage(
        //       image: AssetImage(assetImage),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        errorWidget: (context, url, error) => Container(
          width: sizeWidth ?? size,
          height: sizeHeight ?? size,
          decoration: BoxDecoration(
            borderRadius: Utils.handleRequestRadius(
                radiusType: radiusType, radius: radius),
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey[300]!),
            image: DecorationImage(
              image: AssetImage(assetImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void showDetail() {
    Get.dialog(
      Dialog(
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.5,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(assetImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(assetImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
