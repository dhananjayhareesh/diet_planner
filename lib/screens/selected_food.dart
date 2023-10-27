import 'package:dietplanner_project/utils/add_food.dart';
import 'package:dietplanner_project/utils/create_food.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.appBarColor,
          title: Text(widget.appBarTitle),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.search,
                    color: widget.appBarColor,
                  ),
                  text: 'Add your food',
                ),
                Tab(
                    icon: Icon(
                      Icons.add,
                      color: widget.appBarColor,
                    ),
                    text: 'Create new food')
              ],
              labelColor: widget.appBarColor,
            ),
            Expanded(
              child: TabBarView(children: [
                TabFood(),
                NewFood(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
