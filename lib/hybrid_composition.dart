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

    return Transform.scale(
      scale: 0.75,
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
    );
  }
}
