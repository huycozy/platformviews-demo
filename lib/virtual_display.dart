import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VirtualDisplayExample extends StatefulWidget {
  const VirtualDisplayExample({Key? key}) : super(key: key);

  @override
  State<VirtualDisplayExample> createState() => _VirtualDisplayExampleState();
}

class _VirtualDisplayExampleState extends State<VirtualDisplayExample> {
  @override
  Widget build(BuildContext context) {
    const String viewType = 'platformviewtype';
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return Transform.scale(
      scale: 0.75,
      child: AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
