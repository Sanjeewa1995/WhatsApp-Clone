import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/presentation/device_layout.dart';
import 'package:whats_app_clone/core/presentation/enum.dart';
import 'package:whats_app_clone/dummy/chat_model.dart';
import 'package:whats_app_clone/features/home/presentation/widgets/chat_card.dart';
import 'package:whats_app_clone/features/select_contact/presentation/screens/select_contact_screen.dart';

class ChatTab extends StatefulWidget {
  final Function tckerForword;
  final Function tckerRewerse;
  const ChatTab({required this.tckerForword, required this.tckerRewerse})
      : super();

  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  void initState() {
    widget.tckerRewerse();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.tckerForword();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    ScreenSize screenSize = getDeviceScreenType(mediaQueryData);
    return Scaffold(
      body: ListView.builder(
            itemCount: dummyData.length + 2,
            itemBuilder: (context, i) {
      bool isLast = (dummyData.length == i);
      if (i == 0) {
        return Container(
          height: getDeviceWiseHeight(
            context: context,
            screenSize: screenSize,
            small: 0.09,
            medium: 0.21,
            large: 0.2,
          ),
        );
      } else if (i == dummyData.length + 1) {
        return Container(height: 50);
      }
      return ChatCard(
        isLast: isLast,
      );
            }),
      floatingActionButton: Container(
        height: getDeviceWiseHeight(
          context: context,
          screenSize: screenSize,
          small: 0.09,
          medium: 0.09,
          large: 0.1,
        ),
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: Colors.greenAccent[700],
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SelectContactScreen()));
            },
          ),
        ),
      ),
    );
  }
}
