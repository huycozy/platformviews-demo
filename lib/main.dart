import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_platformviews/hybrid_composition.dart';
import 'package:test_platformviews/native_view_ios.dart';
import 'package:test_platformviews/virtual_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? choice = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Platform.isAndroid ? _buildAndroid() : _buildIOS()
        ),
      ),
    );
  }

  _buildAndroid() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Builder(
          builder: (context) {
            return TextButton(
              child: const Text('Hybrid Composition'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HybridCompositionExample()),
                );
              },
            );
          }
      ),
      Builder(
          builder: (context) {
            return TextButton(
              child: const Text('Virtual Display'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VirtualDisplayExample()),
                );
              },
            );
          }
      ),
    ],
  );

  _buildIOS() => Builder(
      builder: (context) {
        return TextButton(
          child: const Text('UiKitView iOS'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NativeViewIOS()),
            );
          },
        );
      }
  );
}
