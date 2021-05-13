import 'package:flutter/material.dart';
import 'package:whats_app_clone/presentation/register/register_screen.dart';
import 'package:whats_app_clone/presentation/register/verifyPNScrenn.dart';
import 'package:whats_app_clone/presentation/select_contact/select_contact_screen.dart';
import 'package:whats_app_clone/presentation/tab_view/tab_view_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xff075e54),
        accentColor: Color(0xff25D366),
        indicatorColor: Colors.black,
        primaryColorDark: Color(0xFF128C7E),
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
     ),
      home: VerifyPNScreen(),
    );
  }
}
