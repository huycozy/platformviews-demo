import 'package:flutter/material.dart';
import 'package:test_platformviews/hybrid_composition.dart';
import 'package:test_platformviews/virtual_display.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: const VirtualDisplayExample(),
      ),
    ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    double radius = 24;

    final path = Path();

    path.moveTo(0, radius);
    path.lineTo(0, h * 0.8);

    path.lineTo(w * 0.92, h * 0.8);

    path.lineTo(w, radius);

    path.lineTo(radius, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
