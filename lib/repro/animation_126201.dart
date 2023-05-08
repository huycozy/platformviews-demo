import 'package:flutter/material.dart';
import 'package:test_platformviews/hybrid_composition.dart';
import 'package:test_platformviews/virtual_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ValueNotifier<double> currentSize = ValueNotifier(50);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<double>(
                valueListenable: currentSize,
                builder: (context, double size, child) {
                  return AnimatedContainer(
                    height: size,
                    width: size,
                    duration: const Duration(milliseconds: 500),
                    child: const VirtualDisplayExample(),
                  );
                },
              ),
              screenshotWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget screenshotWidget() {
    return ElevatedButton(
        onPressed: () {
          currentSize.value = currentSize.value == 50 ? MediaQuery.of(context).size.width : 50;
        },
        child: Text('Change size'));
  }
}