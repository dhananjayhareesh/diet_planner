import 'package:dietplanner_project/database/db_breakrecipe.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateRecipe extends StatefulWidget {
  const CreateRecipe({Key? key}) : super(key: key);

  @override
  _CreateRecipeState createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController preparationController = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        title: Text('Create Breakfast Recipe'),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputContainer(titleController, 'Title', 1),
                  SizedBox(height: 16.0),
                  _buildInputContainer(ingredientsController, 'Ingredients', 3),
                  SizedBox(height: 16.0),
                  _buildInputContainer(preparationController, 'Preparation', 5),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _getImage();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 169, 61),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Add Image'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: _image != null
                        ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Text('No Image Uploaded'),
                          ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Image is required'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            _addToRecipeList();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 53, 160, 56),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Add to Recipe List'),
                    ),
                  ),
                ],
              ),
            ),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$labelText is required';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          maxLines: maxLines,
        ),
      ),
    );
  }

  Future<void> _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
  }

  Future<void> _addToRecipeList() async {
    final Box<Recipe> recipeBox = await Hive.openBox<Recipe>('recipes');

    final Recipe newRecipe = Recipe(
      titleController.text,
      ingredientsController.text,
      preparationController.text,
      _image?.path ?? '',
    );

    recipeBox.add(newRecipe);

    print('Data stored');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue[300],
        content: Text('New Recipe Added: ${newRecipe.title}'),
        duration: Duration(seconds: 2),
      ),
    );

    Navigator.pop(context, newRecipe);
  }
}
