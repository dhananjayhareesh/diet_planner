import 'package:dietplanner_project/controller/Widgets/bottom_nav_screen_widgets/diary_widgets.dart';
import 'package:flutter/material.dart';

class ScreenDiary extends StatefulWidget {
  const ScreenDiary({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenDiaryState createState() => _ScreenDiaryState();
}

class _ScreenDiaryState extends State<ScreenDiary> {
  @override
  Widget build(BuildContext context) {
    DiaryWidget diaryWidget = DiaryWidget();
    return Scaffold(
      appBar: diaryWidget.appBar(),
      body: diaryWidget.mainBodyContainer(),
    );
  }
}
