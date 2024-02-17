import 'package:flutter/material.dart';

class MyCircularProgress extends StatelessWidget {
  const MyCircularProgress({required this.color, this.size, super.key});

  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          CircularProgressIndicator(
            color: color.withOpacity(.2),
            strokeWidth: 1.5,
            value: 1,
          ),
          CircularProgressIndicator(
            color: color,
            strokeWidth: 1.5,
          ),
        ],
      ),
    );
  }
}
