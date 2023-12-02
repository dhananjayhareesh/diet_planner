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
        automaticallyImplyLeading: false,
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
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildRecipeCategoryCard(
                  'BREAKFAST',
                  'assets/recipebreak.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BreakRecipe()),
                    );
                  },
                ),
                buildRecipeCategoryCard('LUNCH', 'assets/recipelunch.jpg', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LunchRecipe()),
                  );
                }),
                buildRecipeCategoryCard(
                  'DINNER',
                  'assets/recipedinner.jpg',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DinnerRecipe()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRecipeCategoryCard(
    String category,
    String imageAsset,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 5, // Add elevation for shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover, // Adjusted to cover the entire container
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                color: Colors.black.withOpacity(0.7),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
