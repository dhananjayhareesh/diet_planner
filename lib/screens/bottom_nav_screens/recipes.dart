import 'package:dietplanner_project/screens/recipes/breakfast/break_recipe.dart';
import 'package:dietplanner_project/screens/recipes/dinner/dinner_recipe.dart';
import 'package:dietplanner_project/screens/recipes/fav_recipe.dart';
import 'package:dietplanner_project/screens/recipes/lunch/lunch_recipe.dart';

import 'package:flutter/material.dart';

class ScreenRecipes extends StatelessWidget {
  const ScreenRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipes'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'BREAKFAST',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BreakRecipe()),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/recipebreak.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'LUNCH',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LunchRecipe()),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/recipelunch.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'DINNER',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DinnerRecipe()),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage('assets/recipedinner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
