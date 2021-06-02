import 'package:flutter/material.dart';

class NewContactCard extends StatelessWidget {
  const NewContactCard() : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 23,
        child: Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
      title: Text(
        'New contact',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
      ),
    );
  }
}
