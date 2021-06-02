import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/presentation/device_layout.dart';
import 'package:whats_app_clone/core/presentation/enum.dart';
import 'package:whats_app_clone/features/chat/presentation/screens/chat_screen.dart';

class ChatCard extends StatelessWidget {
  final bool isLast;
  const ChatCard({required this.isLast}) : super();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    ScreenSize screenSize = getDeviceScreenType(mediaQueryData);
    double blockSizeVertical = getBlockSizeVertical(context);
    print(screenHeight.toString() + 'size');
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => ChatScreen()));
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CircleAvatar(
                    radius: getDeviceWiseHeight(
                      context: context,
                      screenSize: screenSize,
                      small: 0.04,
                      medium: 0.045,
                      large: 0.05,
                    ),
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: Icon(
                      Icons.group,
                      size: getDeviceWiseHeight(
                        context: context,
                        screenSize: screenSize,
                        small: 0.045,
                        medium: 0.05,
                        large: 0.05,
                      ),
                      color: Colors.white,
                    )),
                SizedBox(
                  width: getDeviceWiseHeight(
                    context: context,
                    screenSize: screenSize,
                    small: 0.045,
                    medium: 0.025,
                    large: 0.025,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Malaka',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: getDeviceWiseHeight(
                            context: context,
                            screenSize: screenSize,
                            small: 0.027,
                            medium: 0.03,
                            large: 0.03),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done_all,
                          color: Colors.greenAccent,
                          size: blockSizeVertical * 3,
                        ),
                        Text(
                          'gn.bs',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: blockSizeVertical * 2.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Yesterday',
                      style: TextStyle(
                        color: Color(0xff25D366),
                        fontWeight: FontWeight.w700,
                        fontSize: blockSizeVertical * 2,
                      ),
                    ),
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: blockSizeVertical * 2,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.greenAccent[700],
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: blockSizeVertical * 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (!isLast)
            Padding(
              padding: EdgeInsets.only(
                left: blockSizeVertical * 14,
                right: 15,
                top: getDeviceWiseHeight(
                  context: context,
                  screenSize: screenSize,
                  small: 0.0,
                  medium: 0.015,
                  large: 0.02,
                ),
                bottom: getDeviceWiseHeight(
                  context: context,
                  screenSize: screenSize,
                  small: 0.0,
                  medium: 0.015,
                  large: 0.02,
                ),
              ),
              child: Container(
                height: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
            )
        ],
      ),
    );
  }
}
