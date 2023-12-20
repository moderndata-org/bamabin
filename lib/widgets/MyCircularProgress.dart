import 'package:flutter/material.dart';

class MyCircularProgress extends StatelessWidget {
  const MyCircularProgress({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
