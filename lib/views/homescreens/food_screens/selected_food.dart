import 'package:dietplanner_project/views/homescreens/food_screens/add_food.dart';

import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  final String appBarTitle;
  final Color appBarColor;
  const AddFood(
      {super.key, required this.appBarTitle, required this.appBarColor});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text(widget.appBarTitle),
      ),
      body: const TabFood(),
    );
  }
}
