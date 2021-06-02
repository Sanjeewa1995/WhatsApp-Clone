import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:whats_app_clone/core/globle.dart';
import 'package:whats_app_clone/core/injection/injection.dart';
import 'package:whats_app_clone/presentation/core/my_app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  configureInjection(Environment.prod);
//  runApp(
// DevicePreview(
//     builder: (context) =>
//     MyApp(),
//      enabled: true,
//     )
//   );
 
  runApp(MyApp());
}
