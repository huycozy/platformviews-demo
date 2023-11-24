import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_platformviews/hybrid_composition.dart';
import 'package:test_platformviews/native_view_ios.dart';
import 'package:test_platformviews/virtual_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? choice = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        print('onGenerateRoute: $settings');
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
                settings: const RouteSettings(name: 'TabsViewer'));
          case '/webview':
            return MaterialPageRoute(
                builder: (context) =>
                    Platform.isAndroid ? const HybridCompositionExample() : const NativeViewIOS(),
                settings: const RouteSettings(name: 'WebView'));
        }
        return null;
      },
      onGenerateInitialRoutes: (initialRoute) {
        print('onGenerateInitialRoutes: $initialRoute');
        return [
          MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
          MaterialPageRoute(
            builder: (context) =>
                Platform.isAndroid ? const HybridCompositionExample() : const NativeViewIOS(),
          ),
          MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        ];
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
