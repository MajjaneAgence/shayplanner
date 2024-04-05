import 'package:flutter/material.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';

class GalleryLoading extends StatelessWidget {
  const GalleryLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 100.0.wp,
        height: 52.0.hp,
        color: Colors.red,
      ),
    );
  }
}
