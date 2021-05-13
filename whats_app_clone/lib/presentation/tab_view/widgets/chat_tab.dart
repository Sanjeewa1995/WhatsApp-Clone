import 'package:flutter/material.dart';
import 'package:whats_app_clone/dummy/chat_model.dart';
import 'package:whats_app_clone/presentation/tab_view/widgets/chat_list_tile.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, i) {
          bool isLast = (dummyData.length - 1 == i);
          return ChatListTile(
            isLast: isLast,
          );
        });
  }
}
