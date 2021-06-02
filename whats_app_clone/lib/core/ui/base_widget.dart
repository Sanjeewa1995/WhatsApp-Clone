import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/ui/sizing_information.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({required this.builder}) : super();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = 0;
    double deviceHeight = 0;

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    print(deviceHeight);

    return LayoutBuilder(builder: (context, boxConstraints) {
      var sizingInformation = SizingInformation(
        // orientation: mediaQuery.orientation,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
        screenHeight: deviceHeight, screenWidth: deviceWidth,
      );
      return builder(context, sizingInformation);
    });
  }
}
