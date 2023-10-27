import 'package:dietplanner_project/utils/model_food.dart';
import 'package:dietplanner_project/utils/search.dart';
import 'package:flutter/material.dart';

class SelectedFoodItem {
  final FoodItem foodItem;
  int quantity;

  SelectedFoodItem(this.foodItem, this.quantity);
}

class TabFood extends StatefulWidget {
  const TabFood({super.key});

  @override
  State<TabFood> createState() => _TabFoodState();
}

class _TabFoodState extends State<TabFood> {
  List<SelectedFoodItem> selectedItems = [];

  int calculateTotalCalories() {
    int totalCalories = 0;
    for (final selectedFoodItem in selectedItems) {
      totalCalories +=
          selectedFoodItem.foodItem.calories * selectedFoodItem.quantity;
    }
    return totalCalories;
  }

  void updateItemQuantity(FoodItem item) {
    final index = selectedItems
        .indexWhere((selectedItem) => selectedItem.foodItem.name == item.name);
    if (index != -1) {
      selectedItems[index].quantity++;
    } else {
      selectedItems.add(SelectedFoodItem(item, 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Tooltip(
        message: "Add Food",
        child: FloatingActionButton(
          onPressed: () async {
            FoodItem? selected = await Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return SearchFood();
            }));

            if (selected != null) {
              setState(() {
                updateItemQuantity(selected);
              });
            }
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Selected Food',
              style: TextStyle(fontSize: 25),
            ),
          ),
          if (selectedItems.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  final selectedFoodItem = selectedItems[index];
                  return ListTile(
                    title: Text(
                        "${selectedFoodItem.foodItem.name} (Quantity: ${selectedFoodItem.quantity})"),
                    subtitle: Text(
                        "Calories: ${selectedFoodItem.foodItem.calories * selectedFoodItem.quantity} kcal"),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total Calories:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${calculateTotalCalories()} kcal",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 236, 34, 84),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
