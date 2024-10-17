import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class VirtualDisplayExample extends StatefulWidget {
  const VirtualDisplayExample({Key? key}) : super(key: key);

  @override
  State<VirtualDisplayExample> createState() => _VirtualDisplayExampleState();
}

class _VirtualDisplayExampleState extends State<VirtualDisplayExample> {
  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Platform Views');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var angle = 0.0;
  var alignment = Alignment.centerLeft;
  String viewType = 'platformviewtype';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  static const _alignmentValues = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.00125)
      ..rotateY(angle);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Slider(
            value: angle,
            onChanged: (v) => setState(() => angle = v),
            min: -pi / 2,
            max: pi / 2,
          ),
          DropdownButton<Alignment>(
            value: alignment,
            onChanged: (v) => setState(() => alignment = v!),
            items: _alignmentValues
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.toString()),
                    ))
                .toList(),
          ),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Transform(
                transform: transform,
                alignment: alignment,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: MyFlutterView(),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: platformView(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget platformView() => AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
}

class MyFlutterView extends StatelessWidget {
  const MyFlutterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 160.0,
      child: Container(
        color: Colors.orange,
        child: const Text('Text from Flutter'),
      ),
    );
  }
}
