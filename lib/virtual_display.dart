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
  double heightValue = 300;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: heightValue,
          color: const Color(0xffff6600),
          child: Center(
            child: SizedBox(
              height: 300,
              child: platformView(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              heightValue += 50; // Increase height
            });
          },
          child: const Text('Increase Height'),
        ),
      ],
    );
  }

  Widget platformView() {
    return AndroidView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
