import 'package:flutter/material.dart';
import 'package:whats_app_clone/features/chat/presentation/widgets/chat_app_bar.dart';
import 'package:whats_app_clone/features/chat/presentation/widgets/chat_form_field.dart';
import 'package:whats_app_clone/features/chat/presentation/widgets/own_message_card.dart';
import 'package:whats_app_clone/features/chat/presentation/widgets/reply_card.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen() : super();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/chat_background.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(children: [
          ListView(
            children: [
              OwnMessageCard(),
              ReplyCard(),
              OwnMessageCard(),
              ReplyCard(),
              OwnMessageCard(),
              ReplyCard(),
              SizedBox(height: 70,)
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ChatFormField(),
          ),
        ]),
      ),
    );
  }
}
