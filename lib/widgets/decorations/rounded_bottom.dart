import 'package:flutter/material.dart';

class RoundedClipPathBottom extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
  
    final path = Path();
    
    path.quadraticBezierTo(w * 0.5, h + 10, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
  
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}