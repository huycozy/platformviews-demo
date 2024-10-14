import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_platformviews/hybrid_composition.dart';
import 'package:test_platformviews/native_view_ios.dart';
import 'package:test_platformviews/native_view_macos.dart';
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
        body: Center(child: _buildPlatformViews()),
      ),
    );
  }

  _buildPlatformViews() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _buildAndroid();
      case TargetPlatform.iOS:
        return _buildIOS();
      case TargetPlatform.macOS:
        return _buildMacOS();
      default:
        throw UnsupportedError('Unsupported platform view');
    }
  }

  _buildAndroid() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            return TextButton(
              child: const Text('Hybrid Composition'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HybridCompositionExample()),
                );
              },
            );
          }),
          Builder(builder: (context) {
            return TextButton(
              child: const Text('Virtual Display'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VirtualDisplayExample()),
                );
              },
            );
          }),
        ],
      );

  _buildIOS() => Builder(builder: (context) {
        return TextButton(
          child: const Text('UiKitView iOS'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NativeViewIOS()),
            );
          },
        );
      });

  _buildMacOS() => Builder(builder: (context) {
        return TextButton(
          child: const Text('AppKitView macOS'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NativeViewMacOS()),
            );
          },
        );
      });
}
