import 'package:flutter/material.dart';

class RoundedClipPathTop extends CustomClipper<Path> {
  const RoundedClipPathTop({
    required this.height
  });

  final double height;

  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
  
    final path = Path();
    
    path.lineTo(0, h - height);
    path.quadraticBezierTo(w * 0.5, 0, w, h - height);
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