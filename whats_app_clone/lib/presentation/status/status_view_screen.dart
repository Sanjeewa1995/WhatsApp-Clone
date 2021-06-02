import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:story_view/controller/story_controller.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:story_view/widgets/story_view.dart';

class StatusViewScreen extends StatefulWidget {
  StatusViewScreen() : super();

  @override
  _StatusViewScreenState createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen> {
  final storyController = StoryController();

  List<StoryItem> storyItems = [
    StoryItem.text(
        title: '"WOW !!! i built my first status story"',
        backgroundColor: Colors.pinkAccent,
        textStyle: TextStyle(fontSize: 25))
  ];

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        progressPosition: ProgressPosition.top,
        repeat: true,
        controller: storyController,
        storyItems: storyItems,
      ),
    );
  }
}
