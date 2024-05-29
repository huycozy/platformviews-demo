import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class NativeViewIOS extends StatefulWidget {
  const NativeViewIOS({Key? key}) : super(key: key);

  @override
  State<NativeViewIOS> createState() => _NativeViewIOSState();
}

class _NativeViewIOSState extends State<NativeViewIOS> {
  // This is used in the platform side to register the view.
  String viewType = 'platformviewtype';

  // Pass parameters to the platform side.
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
        child: UiKitView(
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
