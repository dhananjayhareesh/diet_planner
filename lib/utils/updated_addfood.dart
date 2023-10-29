import 'package:dietplanner_project/utils/model_food.dart';
import 'package:flutter/material.dart';

class AddFoodScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  AddFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Food'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 229, 224, 224),
                ),
                height: 100,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 59,
                        width: 59,
                        child: Image.asset('assets/diet.png')),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Create a food")
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color.fromARGB(255, 229, 224, 224),
              child: Center(
                child: Text(
                  'Food Name',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "ex.Chicken Soup"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color.fromARGB(255, 229, 224, 224),
              child: Center(
                child: Text(
                  'Calories',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: caloriesController,
                decoration: const InputDecoration(labelText: "ex. 120 kcal"),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 236, 34, 84),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () {
                final name = nameController.text;
                final calories = int.tryParse(caloriesController.text);
                if (name.isNotEmpty && calories != null) {
                  final newFoodItem = FoodItem(name: name, calories: calories);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Food added to list'),
                    ),
                  );

                  Navigator.pop(context, newFoodItem);
                }
              },
              child: const Text("Add to food list"),
            ),
          ],
        ),
      ),
    );
  }
}
