import 'package:dietplanner_project/screens/recipes/breakfast/break_recipe.dart';
import 'package:dietplanner_project/screens/recipes/dinner/dinner_recipe.dart';
import 'package:dietplanner_project/screens/recipes/lunch/lunch_recipe.dart';
import 'package:flutter/material.dart';

class ScreenRecipes extends StatelessWidget {
  const ScreenRecipes({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipes'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.blue[500]!, Colors.blue[900]!],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildRecipeCategory('BREAKFAST', 'assets/recipebreak.jpg', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BreakRecipe()),
                  );
                }),
                buildRecipeCategory('LUNCH', 'assets/recipelunch.jpg', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LunchRecipe()),
                  );
                }),
                buildRecipeCategory('DINNER', 'assets/recipedinner.jpg', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DinnerRecipe()),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRecipeCategory(
      String category, String imageAsset, VoidCallback onTap) {
    return Column(
      children: [
        Center(
          child: Text(
            category,
            style: TextStyle(
                fontSize: 24,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
