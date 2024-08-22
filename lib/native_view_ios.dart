import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeViewIOS extends StatefulWidget {
  const NativeViewIOS({Key? key}) : super(key: key);

  @override
  State<NativeViewIOS> createState() => _NativeViewIOSState();
}

class _NativeViewIOSState extends State<NativeViewIOS> {
  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String viewType = 'platformviewtype';
  final Map<String, dynamic> creationParams = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text('TEST'),
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                    20,
                    (index) => index % 2 == 0
                        ? SizedBox(
                            height: 500,
                            child: platformView(),
                          )
                        : Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.red,
                          ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget platformView() => UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
}
