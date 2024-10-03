import 'dart:math';
import 'package:flutter/material.dart';

class ImageUi extends StatelessWidget {
  const ImageUi({
    required this.src,
    super.key,
    this.width,
    this.height,
    this.rotate,
  });

  final String src;
  final double? width;
  final double? height;
  final double? rotate;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (src.startsWith('http')) {
      imageWidget = rotateImage(
        Image.network(
          src,
          width: width,
          height: height,
        ),
        rotate ?? 0,
      );
    } else {
      imageWidget = rotateImage(
        Image.asset(
          src,
          width: width,
          height: height,
        ),
        rotate ?? 0,
      );
    }
    return imageWidget;
  }

  Widget rotateImage(Image child, double rotate) {
    return Transform.rotate(
      angle: radians(rotate),
      child: child,
    );
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
