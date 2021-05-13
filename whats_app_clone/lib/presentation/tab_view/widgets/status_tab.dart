import 'package:flutter/material.dart';
import 'package:whats_app_clone/presentation/status/status_view_screen.dart';
import 'package:whats_app_clone/presentation/tab_view/widgets/my_status_card.dart';
import 'package:whats_app_clone/presentation/tab_view/widgets/status_list_tile.dart';

class StatusScreen extends StatefulWidget {
  StatusScreen({Key key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MyStatusCard(),
        Container(
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Viewed updates",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Column(children: [
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
          StatusListTile(),
        ],),
        StatusListTile(),
      ],
    );
  }
}
