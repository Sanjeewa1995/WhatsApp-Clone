import 'package:flutter/material.dart';

class MyStatusCard extends StatelessWidget {
  const MyStatusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start:10, top: 8, bottom: 8),
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://s3.amazonaws.com/wll-community-production/images/no-avatar.png"),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 1.0,
                  child: Container(
                    height: 20,
                    width: 20,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Status",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Tap to add status update",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
