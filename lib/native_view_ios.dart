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
    return platformView();
  }

  Widget platformView() => UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
}
