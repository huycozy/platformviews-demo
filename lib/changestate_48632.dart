import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Blur Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _blurRadius = 10;

  void _incrementBlur() {
    setState(() {
      if (_blurRadius <= 90) _blurRadius += 10;
    });
  }

  void _decrementblur() {
    setState(() {
      if (_blurRadius >= 10) _blurRadius -= 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          '$_blurRadius',
                          style: TextStyle(
                            fontSize: 80.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned.fill(
                  //   child: ClipRect(
                  //     child: BackdropFilter(
                  //       filter: ImageFilter.blur(
                  //           sigmaX: _blurRadius.toDouble(),
                  //           sigmaY: _blurRadius.toDouble()),
                  //       child: Container(
                  //         color: Colors.transparent,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned.fill(
                    child: Container(
                      child: UiKitView(
                        viewType: 'blureTest',
                        creationParams: <String, dynamic>{
                          "radius": _blurRadius,
                        },
                        creationParamsCodec: StandardMessageCodec(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: _decrementblur,
                    icon: Icon(
                      Icons.remove,
                      size: 32.0,
                    ),
                  ),
                  IconButton(
                    onPressed: _incrementBlur,
                    icon: Icon(
                      Icons.add,
                      size: 32.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}