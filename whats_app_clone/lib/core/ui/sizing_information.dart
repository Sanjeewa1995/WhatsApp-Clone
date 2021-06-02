import 'package:flutter/cupertino.dart';

class SizingInformation {
  final Orientation? orientation;
  // final DeviceScreenType deviceType;
  final double? screenHeight;
  final double? screenWidth;
  final Size? localWidgetSize;

  SizingInformation(
      {this.screenWidth,
      this.orientation,
      this.screenHeight,
      this.localWidgetSize});
}
