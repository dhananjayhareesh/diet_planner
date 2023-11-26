import 'package:dietplanner_project/database/model_food.dart';
import 'package:dietplanner_project/database/model_selected_food.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/utils/search.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TabFood extends StatefulWidget {
  const TabFood({Key? key}) : super(key: key);

  @override
  State<TabFood> createState() => _TabFoodState();
}

class _TabFoodState extends State<TabFood> {
  late Box<FoodItem> foodBox;
  late Box<SelectedFoodItem> selectedFoodBox;
  late Box<TotalCalories> totalCaloriesBox;

  List<SelectedFoodItem> selectedItems = [];
  int totalCalories = 0;

  @override
  void initState() {
    super.initState();
    foodBox = Hive.box<FoodItem>('foodBox');
    selectedFoodBox = Hive.box<SelectedFoodItem>('selectedFoodBox');
    totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');

    // Retrieve existing selected items from the Hive box
    selectedItems = selectedFoodBox.values.toList();

    // Retrieve total calories from the Hive box
    totalCalories = totalCaloriesBox
            .get('totalCalories', defaultValue: TotalCalories(0))
            ?.total ??
        0;
  }

  @override
  void dispose() {
    // Close Hive boxes
    //foodBox.close();
    //selectedFoodBox.close();
    //totalCaloriesBox.close();
    super.dispose();
  }

  void updateHive(List<SelectedFoodItem> items) {
    // Remove items that are not in the updated list
    selectedFoodBox.keys
        .where((key) => !items.any((item) => item.foodItem.name == key))
        .toList()
        .forEach(selectedFoodBox.delete);

    // Update Hive box with the modified list
    selectedFoodBox.putAll(
      Map.fromEntries(
        items.map(
          (item) => MapEntry(item.foodItem.name, item),
        ),
      ),
    );

    // Recalculate and save total calories
    totalCalories = calculateTotalCalories();
    totalCaloriesBox.put('totalCalories', TotalCalories(totalCalories));
  }

  void updateItemQuantity(FoodItem item) {
    final index = selectedItems
        .indexWhere((selectedItem) => selectedItem.foodItem.name == item.name);
    if (index != -1) {
      selectedItems[index].quantity++;
    } else {
      selectedItems.add(SelectedFoodItem(item, 1));
    }

    // Save the updated list to the Hive box
    updateHive(selectedItems);
  }

  int calculateTotalCalories() {
    int totalCalories = 0;
    for (final selectedFoodItem in selectedItems) {
      totalCalories +=
          selectedFoodItem.foodItem.calories * selectedFoodItem.quantity;
    }
    return totalCalories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "History of added food item's",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  final selectedFoodItem = selectedItems[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "${selectedFoodItem.foodItem.name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Calories: ${selectedFoodItem.foodItem.calories * selectedFoodItem.quantity} kcal",
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Quantity: ${selectedFoodItem.quantity}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.green[700],
                            onPressed: () {
                              setState(() {
                                selectedItems[index].quantity++;
                              });
                              updateHive(selectedItems);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.orange[700],
                            onPressed: () {
                              setState(() {
                                if (selectedItems[index].quantity > 1) {
                                  selectedItems[index].quantity--;
                                } else {
                                  selectedItems.removeAt(index);
                                }
                              });
                              updateHive(selectedItems);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red[700],
                            onPressed: () {
                              setState(() {
                                selectedItems.removeAt(index);
                              });
                              updateHive(selectedItems);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add to diet'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Color.fromARGB(255, 236, 34, 84),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Today's Total Calories: ${calculateTotalCalories()} kcal",
              style: TextStyle(fontSize: 15, color: Colors.red[900]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
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
        label: Text('Add Food'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
