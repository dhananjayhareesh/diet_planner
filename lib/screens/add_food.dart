import 'package:flutter/material.dart';

class AddFood extends StatefulWidget {
  final String appBarTitle;
  final Color appBarColor;
  AddFood({super.key, required this.appBarTitle, required this.appBarColor});

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
    );
  }
}
