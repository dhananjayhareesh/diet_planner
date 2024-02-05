import 'dart:io';

import 'package:dietplanner_project/database/db_breakrecipe.dart';
import 'package:dietplanner_project/screens/recipes/breakfast/recipe_details.dart';
import 'package:dietplanner_project/screens/recipes/breakfast/create_recipe.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

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
        title: const Text('My Breakfast Recipes'),
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        centerTitle: true,
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
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Recipe>('recipes').listenable(),
          builder: (context, Box<Recipe> box, _) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: box.length,
              itemBuilder: (context, index) {
                Recipe recipe = box.getAt(index) as Recipe;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetails(recipe: recipe),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Container(
                      height: 200,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white54,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 138,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: FileImage(File(recipe.imagePath)),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                right: 10,
                                left: 10,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _deleteRecipe(recipe);
                                    },
                                    child: SizedBox(
                                      height: 30,
                                      child: Image.asset(
                                        'assets/deleterecipie.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(recipe.title),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Tooltip(
        message: "Add New Recipe",
        child: FloatingActionButton(
          onPressed: _navigateToCreateRecipePage,
          backgroundColor: Colors.blue[300],
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> _navigateToCreateRecipePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateRecipe()),
    );

    if (result != null && result is Recipe) {}
  }

  void _deleteRecipe(Recipe recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Recipe'),
          content: Text('Are you sure you want to delete ${recipe.title}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _performDelete(recipe);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _performDelete(Recipe recipe) {
    final Box<Recipe> recipeBox = Hive.box<Recipe>('recipes');

    // Find the index of the recipe in the box based on title
    int index =
        recipeBox.values.toList().indexWhere((r) => r.title == recipe.title);

    if (index != -1) {
      recipeBox.deleteAt(index);
    }
  }
}
