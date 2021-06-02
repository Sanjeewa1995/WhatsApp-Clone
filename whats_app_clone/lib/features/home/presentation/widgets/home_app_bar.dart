import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/presentation/device_layout.dart';
import 'package:whats_app_clone/core/presentation/enum.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Listenable animation;
  final double dy;
  final TabController controller;
  final List<Widget> tabs;
  const HomeAppBar(
      {required this.animation,
      required this.dy,
      required this.controller,
      required this.tabs})
      : super();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    ScreenSize screenSize = getDeviceScreenType(mediaQueryData);
    return AnimatedBuilder(
      animation: animation,
      builder: (cotext, child) {
        return Transform.translate(
          offset: Offset(0, dy),
          child: Container(
            color: Color(0xff075e54),
            padding: EdgeInsets.only(
              top: getDeviceWiseHeight(
                context: context,
                screenSize: screenSize,
                small: 0.038,
                medium: 0.02,
                large: 0.02,
              ),
            ),
            height: getDeviceWiseHeight(
              context: context,
              screenSize: screenSize,
              small: 0.038,
              medium: 0.19,
              large: 0.2,
            ),
            child: AppBar(
              toolbarHeight: getDeviceWiseHeight(
                context: context,
                screenSize: screenSize,
                small: 0.07,
                medium: 0.05,
                large: 0.07,
              ),
              title: Text(
                'WhatsApp Clone',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getDeviceWiseHeight(
                      context: context,
                      screenSize: screenSize,
                      small: 0.038,
                      medium: 0.032,
                      large: 0.043,
                    )),
              ),
              actions: <Widget>[
                IconButton(
                    iconSize: getDeviceWiseHeight(
                      context: context,
                      screenSize: screenSize,
                      small: 0.04,
                      medium: 0.04,
                      large: 0.05,
                    ),
                    icon: Icon(Icons.search),
                    onPressed: () {}),
                PopupMenuButton<String>(
                  iconSize: getDeviceWiseHeight(
                    context: context,
                    screenSize: screenSize,
                    small: 0.04,
                    medium: 0.04,
                    large: 0.05,
                  ),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        child: Text('New group'),
                        value: 'New group',
                      ),
                      PopupMenuItem(
                        child: Text('New broadcast'),
                        value: 'New broadcast',
                      ),
                      PopupMenuItem(
                        child: Text('Whatsapp Web'),
                        value: 'Whatsapp Web',
                      ),
                      PopupMenuItem(
                        child: Text('Starred messages'),
                        value: 'Starred message',
                      ),
                      PopupMenuItem(
                        child: Text('Settings'),
                        value: 'Settings',
                      ),
                    ];
                  },
                )
              ],
              bottom: TabBar(
               isScrollable: true,
               labelPadding: EdgeInsets.zero,
               indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: getDeviceWiseHeight(
                  context: context,
                  screenSize: screenSize,
                  small: 0.04,
                  medium: 0.004,
                  large: 0.004,
                ),
                indicatorColor: Colors.white,
                tabs: tabs,
                labelStyle: TextStyle(fontWeight: FontWeight.w900),
                controller: controller,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200.0);
}
