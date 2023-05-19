import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_platformviews/native_view_ios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 500,
            child: NativeViewIOS()
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: const Text('Some text'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}