import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VirtualDisplayExample extends StatefulWidget {
  const VirtualDisplayExample({Key? key}) : super(key: key);

  @override
  State<VirtualDisplayExample> createState() => _VirtualDisplayExampleState();
}

class _VirtualDisplayExampleState extends State<VirtualDisplayExample> {
  String viewType = 'platformviewtype';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return platformView();
  }

  Widget platformView() => AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
}
