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

    return Scaffold(
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index != 0 && index % 5 == 0) {
            return SizedBox(
              height: 100,
              child: AndroidView(
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
