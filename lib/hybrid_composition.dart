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
  // This is used in the platform side to register the view.
  String viewType = 'platformviewtype';
  // Pass parameters to the platform side.
  Map<String, dynamic> creationParams = <String, dynamic>{};
  double heightValue = 300;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: heightValue,
          color: const Color(0xffff6600),
          child: Center(
            child: platformView(),
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
    return PlatformViewLink(
      viewType: viewType,
      surfaceFactory: (context, controller) {
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
    );
  }
}
