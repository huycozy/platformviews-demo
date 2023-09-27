import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewIOS extends StatefulWidget {
  const NativeViewIOS({Key? key}) : super(key: key);

  @override
  State<NativeViewIOS> createState() => _NativeViewIOSState();
}

class _NativeViewIOSState extends State<NativeViewIOS> {
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'platformviewtype';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index != 0 && index % 5 == 0) {
            return SizedBox(
              height: 100,
              child: UiKitView(
                viewType: viewType,
                layoutDirection: TextDirection.ltr,
                creationParams: creationParams,
                creationParamsCodec: const StandardMessageCodec(),
              ),
            );
          }
          return Container(
            height: 200,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
      ),
    );
  }
}
