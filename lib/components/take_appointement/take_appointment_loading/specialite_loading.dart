import 'package:flutter/material.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';

class SpecialiteLoading extends StatelessWidget {
  const SpecialiteLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 100.0.wp,
        height: 5.5.hp,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0.sp)),
      ),
    );
  }
}
