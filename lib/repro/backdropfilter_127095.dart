import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_platformviews/native_view_ios.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: -1.0, sigmaY: 15.0),
          child: Container(
            color: Colors.white.withOpacity(0.7),
            child: const Text('Some text'),
          ),
        ),
      ),
      body: const NativeViewIOS(),
    );
  }
}