import 'package:flutter/material.dart';
import 'package:whats_app_clone/presentation/tab_view/widgets/chat_tab.dart';
import 'package:whats_app_clone/presentation/tab_view/widgets/status_tab.dart';

class TabViewScreen extends StatefulWidget {
  @override
  _TabViewScreenState createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  final _tabs = <Widget>[
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
          bottom: TabBar(
            tabs: _tabs,
            controller: _tabController,
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          Text('camera'),
          ChatTab(),
          StatusScreen(),
          Text('calls'),
        ]),
        floatingActionButton: showFab
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () => print("open chats"),
              )
            : null,
      ),
    );
  }
}
