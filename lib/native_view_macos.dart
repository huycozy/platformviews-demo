import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewMacOS extends StatefulWidget {
  const NativeViewMacOS({Key? key}) : super(key: key);

  @override
  State<NativeViewMacOS> createState() => _NativeViewIOSState();
}

class _NativeViewIOSState extends State<NativeViewMacOS> {
  String viewType = 'platformviewtype';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return platformView();
  }

  Widget platformView() => AppKitView(
    viewType: viewType,
    layoutDirection: TextDirection.ltr,
    creationParams: creationParams,
    creationParamsCodec: const StandardMessageCodec(),
  );
}
