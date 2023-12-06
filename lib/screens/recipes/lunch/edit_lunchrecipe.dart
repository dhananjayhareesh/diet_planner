// ignore_for_file: use_build_context_synchronously, use_key_in_widget_constructors

import 'package:dietplanner_project/database/db_lunchrecipe.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LunchEdit extends StatefulWidget {
  final RecipeLunch recipe;
  const LunchEdit({Key? key, required this.recipe});

  @override
  State<LunchEdit> createState() => _LunchEditState();
}

class _LunchEditState extends State<LunchEdit> {
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ingredientsController.text = widget.recipe.ingredients;
    preparationController.text = widget.recipe.preparation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Brekfast Recipe'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputContainer(ingredientsController, 'Ingredients', 3),
              const SizedBox(height: 16.0),
              _buildInputContainer(preparationController, 'Preparation', 5),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 53, 160, 56),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  _updateRecipe();
                },
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputContainer(
    TextEditingController controller,
    String labelText,
    int maxLines,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }

  void _updateRecipe() async {
    // Update the original recipe with the edited details
    widget.recipe.ingredients = ingredientsController.text;
    widget.recipe.preparation = preparationController.text;

    // Open the Hive box
    var recipesBox = await Hive.openBox<RecipeLunch>('lunchrecipes');

    // Get the index of the recipe in the box
    int recipeIndex = recipesBox.values.toList().indexOf(widget.recipe);

    // Update the recipe in the box
    await recipesBox.putAt(recipeIndex, widget.recipe);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Recipe Updated'),
        duration: Duration(seconds: 2),
      ),
    );

    // Navigate back to the RecipeDetails page with the updated recipe
    Navigator.pop(context, widget.recipe);
    Navigator.pop(context);
  }
}
