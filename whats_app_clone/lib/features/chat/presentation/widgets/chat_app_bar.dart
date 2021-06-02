import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChatAppBar() : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 65,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              radius: 20,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: new NetworkImage(
                  'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp'),
            ),
          ],
        ),
      ),
      title: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Malaka',
              style: TextStyle(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'last seen today at 12.55',
              style: TextStyle(
                fontSize: 13,
                // fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        PopupMenuButton<String>(onSelected: (value) {
          print(value);
        }, itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: Text('View Contact'),
              value: 'View Contact',
            ),
            PopupMenuItem(
              child: Text('Media, links, and docs'),
              value: 'Media, links, and docs',
            ),
            PopupMenuItem(
              child: Text('Whatsapp Web'),
              value: 'Whatsapp Web',
            ),
            PopupMenuItem(
              child: Text('Search'),
              value: 'Search',
            ),
            PopupMenuItem(
              child: Text('Mute Notification'),
              value: 'Mute Notification',
            ),
            PopupMenuItem(
              child: Text('Wallpaper'),
              value: 'Wallpaper',
            ),
          ];
        })
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
