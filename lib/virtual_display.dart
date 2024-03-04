import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VirtualDisplayExample extends StatefulWidget {
  const VirtualDisplayExample({Key? key}) : super(key: key);

  @override
  State<VirtualDisplayExample> createState() => _VirtualDisplayExampleState();
}

class _VirtualDisplayExampleState extends State<VirtualDisplayExample> {
  String viewType = 'platformviewtype';

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return index == 0
            ? platformView({'id': '1', 'value': 1})
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 16,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return [
                    Container(color: Colors.teal[400]),
                    platformView({'id': '1', 'value': 2}),
                    Container(color: Colors.teal[500]),
                    Container(color: Colors.teal[600]),
                  ][index];
                },
              );
      },
    );
  }

  Widget platformView(Map<String, dynamic> prs) => AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: prs,
        creationParamsCodec: const StandardMessageCodec(),
      );
}
