import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HybridCompositionExample extends StatefulWidget {
  const HybridCompositionExample({Key? key}) : super(key: key);

  @override
  State<HybridCompositionExample> createState() => _HybridCompositionExampleState();
}

class _HybridCompositionExampleState extends State<HybridCompositionExample> {
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'platformviewtype';
    // Pass parameters to the platform side.
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          child: PlatformViewLink(
            viewType: viewType,
            surfaceFactory:
                (context, controller) {
              return AndroidViewSurface(
                controller: controller as AndroidViewController,
                gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
                hitTestBehavior: PlatformViewHitTestBehavior.opaque,
              );
            },
            onCreatePlatformView: (params) {
              return PlatformViewsService.initSurfaceAndroidView(
                id: params.id,
                viewType: viewType,
                layoutDirection: TextDirection.ltr,
                creationParams: creationParams,
                creationParamsCodec: const StandardMessageCodec(),
                onFocus: () {
                  params.onFocusChanged(true);
                },
              )
                ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
                ..create();
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('Title'),
                  content: const Text('Content'),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Text("Show CupertinoAlertDialog"),
        )
      ],
    );
  }
}
