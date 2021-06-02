import 'package:flutter/material.dart';

class AttachmentPopUpCard extends StatefulWidget {
  AttachmentPopUpCard() : super();

  @override
  _AttachmentPopUpCardState createState() => _AttachmentPopUpCardState();
}

class _AttachmentPopUpCardState extends State<AttachmentPopUpCard> {
  _iconCreation(IconData icon, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 80,
        child: InkWell(
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color,
                child: Icon(icon),
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 6),
        //elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconCreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  SizedBox(height: 17),
                  _iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(height: 17),
                  _iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  SizedBox(height: 17),
                  _iconCreation(Icons.room, Colors.blueAccent, 'Room'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                  SizedBox(height: 17),
                  _iconCreation(
                      Icons.location_pin, Colors.greenAccent, 'Location')
                ],
              )
            ],
          ),
        ));
  }
}
