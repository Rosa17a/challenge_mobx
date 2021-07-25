import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CurvedLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.55, size.height * 0.65);
    path.quadraticBezierTo(
      size.width * 0.83,
      size.height * 0.48,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
