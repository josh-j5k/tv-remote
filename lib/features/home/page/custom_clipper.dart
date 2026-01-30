import 'package:flutter/material.dart';

class InvertedCornerShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InvertedCornerClipper(radius: 20.0), // Adjust curve size here
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: const Center(child: Text("Inverted")),
      ),
    );
  }
}

class InvertedCornerClipper extends CustomClipper<Path> {
  final double radius;
  InvertedCornerClipper({required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;
    // Start at top-left, but pushed slightly right to account for the curve
    path.lineTo(0, 0);
    path.moveTo(100, h);
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.moveTo(-100, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
