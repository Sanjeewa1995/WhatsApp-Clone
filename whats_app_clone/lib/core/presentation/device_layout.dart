import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/presentation/enum.dart';

ScreenSize getDeviceScreenType(MediaQueryData mediaQueryData) {
  var orientation = mediaQueryData.orientation;
  double deviceHeight = 0;
  if (orientation == Orientation.landscape) {
    deviceHeight = mediaQueryData.size.width;
  } else {
    deviceHeight = mediaQueryData.size.height;
  }
  if (deviceHeight < 600) {
    return ScreenSize.SMALL;
  } else if (deviceHeight < 800 && deviceHeight > 600) {
    return ScreenSize.MEDIUM;
  } else {
    return ScreenSize.LARGE;
  }
}

double getBlockSizeVertical(BuildContext context) {
  MediaQueryData mediaQueryData = MediaQuery.of(context);
  var orientation = mediaQueryData.orientation;
  double deviceHeight = 0;
  if (orientation == Orientation.landscape) {
    deviceHeight = mediaQueryData.size.width;
  } else {
    deviceHeight = mediaQueryData.size.height;
  }
  double blockSizeVertical = deviceHeight / 100;
  return blockSizeVertical;
}

double getDeviceWiseHeight(
    {required ScreenSize screenSize,
    required BuildContext context,
    required double small,
    required double medium,
    required double large}) {
  switch (screenSize) {
    case ScreenSize.SMALL:
      return MediaQuery.of(context).size.height * small;

    case ScreenSize.MEDIUM:
      {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return MediaQuery.of(context).size.height * medium;
        } else {
          return MediaQuery.of(context).size.width * medium;
        }
      }

    case ScreenSize.LARGE:
      {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return MediaQuery.of(context).size.height * large;
        } else {
          return MediaQuery.of(context).size.width * large;
        }
      }
  }
}
