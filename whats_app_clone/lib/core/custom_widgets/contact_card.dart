import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/model/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  const ContactCard({required this.contact}) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 53,
        child: Stack(
          children: [
            ( contact.avatar.length > 0)
                ? CircleAvatar(
                    radius: 23,
                    backgroundImage: MemoryImage(contact.avatar),
                  )
                : 
                CircleAvatar(
                    radius: 23,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                  ),
            if (contact.isSelected)
              Positioned(
                bottom: 2,
                right: 2,
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 11,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      title: Text(contact.name,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          )),
      subtitle: Text('hey there i am using whatsapp',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          )),
    );
  }
}
