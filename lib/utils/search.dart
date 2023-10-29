import 'package:dietplanner_project/utils/model_food.dart';
import 'package:dietplanner_project/utils/updated_addfood.dart';
import 'package:flutter/material.dart';

class SearchFood extends StatefulWidget {
  SearchFood({Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  List<FoodItem> foodItems = [
    FoodItem(name: "Apple", calories: 52),
    FoodItem(name: "Banana", calories: 105),
    FoodItem(name: "Orange", calories: 85),
    FoodItem(name: "Grape", calories: 50)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
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
                          Navigator.pop(context, foodItem);
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  subtitle: Text("Calories: ${foodItem.calories} kcal"),
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 236, 34, 84),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFoodScreen(),
                ),
              ).then((newFoodItem) {
                if (newFoodItem != null) {
                  setState(() {
                    foodItems.add(newFoodItem);
                  });
                }
              });
            },
            child: Text("Create New Food"),
          ),
        ],
      ),
    );
  }
}
