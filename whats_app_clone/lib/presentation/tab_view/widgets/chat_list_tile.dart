import 'package:flutter/material.dart';

class ChatListTile extends StatelessWidget {
  final bool isLast;
  const ChatListTile({Key key,@required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 75,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(
                    'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Malaka',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                  Text('gn.bs',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.normal)),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Yesterday',
                        style: TextStyle(
                            color: Color(0xff25D366),
                            fontWeight: FontWeight.w400)),
                    SizedBox(height: 7),
                    CircleAvatar(
                      backgroundColor: Color(0xff25D366),
                      radius: 10,
                      child: Text('5',
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      isLast ? Container() :  Padding(
          padding: EdgeInsets.only(left:78, right: 10),
          child: Container(
            height: 0.5,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
