import 'package:flutter/material.dart';

class Customclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    //  path.quadraticBezierTo(0.0, size.height, 20.0, size.height);
    path.lineTo(size.width, size.height);
    //  path.quadraticBezierTo(size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, size.height);
    //  path.quadraticBezierTo(size.width, 30.0, size.width - 20.0, 30.0);
    path.lineTo(size.height, 0.0);
    // path.quadraticBezierTo(0.0, 0.0, 0.0, 20.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
 