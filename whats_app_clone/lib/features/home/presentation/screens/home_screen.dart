import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/presentation/device_layout.dart';
import 'package:whats_app_clone/core/presentation/enum.dart';
import 'package:whats_app_clone/features/home/presentation/pages/camera_page.dart';
import 'package:whats_app_clone/features/home/presentation/pages/chat_page.dart';
import 'package:whats_app_clone/features/home/presentation/pages/status_page.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    controller.addListener(() => setState(() {}));
  }

  TickerFuture? tikerReverse() {
    controller.reverse();
  }

  TickerFuture? tikerForword() {
    if (_tabController.index == 0 || _tabController.index == 1)
      controller.forward();
  }

  List<Widget> getTabs(double fontSize, double tabWith) {
    final _tabs = <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: fontSize * 0.4),
        child: Container(
          width: fontSize * 3,
          child: Tab(
                icon: Icon(
              Icons.camera_alt,
              size: fontSize * 1.8,
            )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: fontSize * 0.4),
        child: Container(
          width: tabWith,
        
          child: Tab(
              child: Text(
                'CHATS',
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: fontSize * 0.4),
        child: Container(
          width: tabWith,
          child: Tab(
            child: Text(
              'STATUS',
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: fontSize * 0.4),
        child: Container(
          width: tabWith,
          child: Tab(
            child: Text(
              'CALLS',
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    ];
    return _tabs;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    ScreenSize screenSize = getDeviceScreenType(mediaQueryData);
    
    double tabFontSize = getDeviceWiseHeight(
      context: context,
      screenSize: screenSize,
      small: 0.022,
      medium: 0.023,
      large: 0.025,
    );
    double tabWidth = (screenWidth - tabFontSize * 3) / 3;
    return DefaultTabController(
      length: getTabs(tabFontSize, tabWidth).length,
      initialIndex: 1,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              TabBarView(controller: _tabController, children: [
                CameraPage(tikerForword, tikerReverse),
                ChatTab(
                  tckerForword: tikerForword,
                  tckerRewerse: tikerReverse,
                ),
                StatusPage(),
                Text('calls'),
              ]),
              HomeAppBar(
                tabs: getTabs(tabFontSize, tabWidth),
                controller: _tabController,
                dy: -controller.value *
                    getDeviceWiseHeight(
                      context: context,
                      screenSize: screenSize,
                      small: 0.045,
                      medium: 0.5,
                      large: 0.05,
                    ),
                animation: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
