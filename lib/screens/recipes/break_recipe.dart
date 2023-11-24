import 'package:dietplanner_project/screens/recipes/recipe_details.dart';
import 'package:dietplanner_project/screens/recipes/create_recipe.dart';
import 'package:flutter/material.dart';

class BreakRecipe extends StatefulWidget {
  const BreakRecipe({super.key});

  @override
  State<BreakRecipe> createState() => _BreakRecipeState();
}

class _BreakRecipeState extends State<BreakRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Breakfast Recipes'),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.blue[200]!],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipieDetails()),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage('assets/brkrecipe1.webp'),
                                    fit: BoxFit.cover)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 30,
                                      child: Image.asset(
                                          'assets/deleterecipie.png')),
                                  Spacer(),
                                  SizedBox(
                                      height: 30,
                                      child: Image.asset('assets/favfood.png')),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Healthy porridge bowl')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: "Add New Recipe",
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateRecipe()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[300],
        ),
      ),
    );
  }
}
