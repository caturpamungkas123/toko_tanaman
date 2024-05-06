import 'package:flutter/material.dart';

class BottomRounded extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.78);
    path.quadraticBezierTo(size.width * 0.5, size.height, size.width, size.height * 0.78);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
