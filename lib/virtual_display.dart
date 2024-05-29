import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('PointerInterceptor demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'AppBar Icon',
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => PointerInterceptor(
                  child: CupertinoAlertDialog(
                    title: Text('Dialog'),
                    content: Text('Dialog'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      ),
      floatingActionButton: PointerInterceptor(
        child: FloatingActionButton(
          child: const Icon(Icons.navigation),
          onPressed: () {},
        ),
      ),
    );
  }
}
