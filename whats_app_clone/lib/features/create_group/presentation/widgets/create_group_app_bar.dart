import 'package:flutter/material.dart';

class CreateGroupAppBar extends StatelessWidget with PreferredSizeWidget {
  const CreateGroupAppBar() : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New group',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          SizedBox(height: 2),
          Text('Add participatants',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 26,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
