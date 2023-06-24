import 'package:flutter/material.dart';
import 'package:getx_pattern_starter/app/common/buttons/x_Icon_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  final EdgeInsets? padding;

  const ListTileShimmer({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {},
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 14,
            color: Colors.white,
          ),
        ),
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: XIconButton(
            icon: MdiIcons.chevronRight,
            margin: const EdgeInsets.all(0),
            tooltip: "selengkapnya",
            size: 25,
            supportColor: Colors.grey[300]!.withOpacity(0.2),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
