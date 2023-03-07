import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:test_platformviews/native_view_example.dart';
import 'package:test_platformviews/virtual_display_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              print("onTap");
            },
            onTapCancel: () {
              print("onTapCancel");
            },
            onLongPress: () {
              print("onTapCancel");
            },
            onDoubleTap: () {
              print("onTapCancel");
            },
            // child: const VirtualDisplayExample(),
            child: const NativeViewExample(),
          ),
        ),
      ),
    );
  }
}
