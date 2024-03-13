import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  const CustomShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.radius,
  });

  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      baseColor: Color.fromARGB(255, 52, 52, 52),
      highlightColor: Color.fromARGB(255, 93, 93, 93),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 5)),
      ),
    );
  }
}
