import 'package:flutter/material.dart';

class NewGroupCard extends StatelessWidget {
  const NewGroupCard() : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 23,
        child: Icon(
          Icons.group,
          color: Colors.white,
        ),
      ),
      title: Text(
        'New group',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }
}
