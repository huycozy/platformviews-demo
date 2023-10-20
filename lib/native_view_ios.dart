import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  var item = [];

  @override
  void initState() {
    super.initState();
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.orange)
      ..loadHtmlString("<h1>WebView</h1>");
    item = [
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: WebViewWidget(controller: controller),
      ),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: WebViewWidget(controller: controller),
      ),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
      thisWidget(),
    ];
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 16 / 9,
      ),
      itemBuilder: (context, index) => item[index],
      itemCount: item.length,
    );
  }

  nativeView() => UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );

  Widget thisWidget() {
    return Container(
      color: Colors.grey.shade200,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: const Center(
        child: Text("Widget"),
      ),
    );
  }
}
