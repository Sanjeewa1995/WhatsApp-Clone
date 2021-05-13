import 'package:flutter/material.dart';

class NewContact extends StatelessWidget {
  const NewContact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 20,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        'New contact',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
