import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/my_status_card.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/other_status_card.dart';

class StatusPage extends StatefulWidget {
  StatusPage() : super();

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(height: 13),
          FloatingActionButton(
            backgroundColor: Colors.greenAccent[700],
            onPressed: () {},
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(height: 110),
          MyStatusCard(),
          _label('Recent update'),
          Column(
            children: [
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
            ],
          ),
          _label("Viewed updates"),
          Column(
            children: [
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
              OtherStatusCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _label(String label) {
    return Container(
      width: double.infinity,
      color: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.grey.shade600, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
