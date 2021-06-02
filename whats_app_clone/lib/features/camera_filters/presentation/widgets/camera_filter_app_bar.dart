import 'package:flutter/material.dart';

class CameraFilterAppBar extends StatelessWidget with PreferredSizeWidget {
  const CameraFilterAppBar() : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.crop_rotate,
              size: 27,
            )),
             IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 27,
            )),
             IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.title,
              size: 27,
            )),
             IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_outlined,
              size: 27,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
