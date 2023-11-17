import 'package:dietplanner_project/screens/bottom_nav_screens/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';

class ScreenProgress extends StatefulWidget {
  const ScreenProgress({super.key});

  @override
  State<ScreenProgress> createState() => _ScreenProgressState();
}

class _ScreenProgressState extends State<ScreenProgress> {
  List<double> weeklySummary = [4.40, 2.50, 42.42, 10.50, 100.20, 88.99, 90.10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Your Weekly Progress'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
          child: SizedBox(
              height: 300,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ))),
    );
  }
}
