import 'package:dietplanner_project/utils/model_food.dart';
import 'package:flutter/material.dart';

class SearchFood extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(name: "Apple", calories: 52),
    FoodItem(name: "Banana", calories: 105),
  ];
  SearchFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Food'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search your food",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final foodItem = foodItems[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(foodItem.name),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context,
                              foodItem); // Pass the selected food item back
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  subtitle: Text("Calories: ${foodItem.calories} kcal"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
