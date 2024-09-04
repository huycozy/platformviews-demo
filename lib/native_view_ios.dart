import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewIOS extends StatefulWidget {
  const NativeViewIOS({Key? key}) : super(key: key);

  @override
  State<NativeViewIOS> createState() => _NativeViewIOSState();
}

class _NativeViewIOSState extends State<NativeViewIOS> {
  String viewType = 'platformviewtype';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: 380,
            height: 380,
            child: platformView(),
          ),
          Stack(
            children: List<Widget>.generate(10000, (index) {
              // The problem already happens with a small amount of widgets.
              // Using an excessive amount of widgets is just to make the problem more evident.
              return Text("Lots of Texts represent a Widget with complex components.");
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: Text("Button"),
              onPressed: () {
                print("Tap ${DateTime.now()}");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget platformView() => UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
}
