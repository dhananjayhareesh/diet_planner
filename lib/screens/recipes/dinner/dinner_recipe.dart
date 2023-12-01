import 'dart:io';
import 'package:dietplanner_project/database/db_dinnerrecipe.dart';
import 'package:dietplanner_project/screens/recipes/dinner/create_dinner_recipe.dart';
import 'package:dietplanner_project/screens/recipes/dinner/recipedinner_details.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class DinnerRecipe extends StatefulWidget {
  const DinnerRecipe({super.key});

  @override
  State<DinnerRecipe> createState() => _DinnerRecipeState();
}

class _DinnerRecipeState extends State<DinnerRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Dinner Recipes'),
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
          valueListenable: Hive.box<RecipeDinner>('dinnerrecipes').listenable(),
          builder: (context, Box<RecipeDinner> box, _) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: box.length,
              itemBuilder: (context, index) {
                RecipeDinner recipe = box.getAt(index) as RecipeDinner;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailsDinner(recipe: recipe),
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
                          SizedBox(
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
          child: Icon(Icons.add),
          backgroundColor: Colors.blue[300],
        ),
      ),
    );
  }

  Future<void> _navigateToCreateRecipePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateRecipeDinner()),
    );

    if (result != null && result is RecipeDinner) {
      print('New recipe added: ${result.title}');
    }
  }

  void _deleteRecipe(RecipeDinner recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Recipe'),
          content: Text('Are you sure you want to delete ${recipe.title}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                _performDelete(recipe);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _performDelete(RecipeDinner recipe) {
    final Box<RecipeDinner> recipeBox = Hive.box<RecipeDinner>('dinnerrecipes');

    // Find the index of the recipe in the box based on title
    int index =
        recipeBox.values.toList().indexWhere((r) => r.title == recipe.title);

    if (index != -1) {
      recipeBox.deleteAt(index);
      print('Recipe deleted: ${recipe.title}');
    } else {
      print('Recipe not found for deletion: ${recipe.title}');
    }
  }
}
