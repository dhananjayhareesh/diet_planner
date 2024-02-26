import 'package:dietplanner_project/database/model_food.dart';
import 'package:dietplanner_project/database/model_selected_food.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/views/homescreens/food_screens/search.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    super.initState();
    foodBox = Hive.box<FoodItem>('foodBox');
    selectedFoodBox = Hive.box<SelectedFoodItem>('selectedFoodBox');
    totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');

    // Retrieve existing selected items from the Hive box
    selectedItems = selectedFoodBox.values.toList();

    // Check if it's a new day, and clear data if needed
    checkAndClearOldData();
  }

  void checkAndClearOldData() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (totalCaloriesBox.containsKey(currentDate)) {
      // It's the same day, do nothing
      return;
    }

    // It's a new day, clear selected items for the new day
    selectedItems.clear();
    updateHive(selectedItems); // Clear selected items in Hive

    // Reset total calories to 0 for the new day
    totalCaloriesBox.put(currentDate, TotalCalories(0));
  }

  @override
  void dispose() {
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
    int totalCalories = calculateTotalCalories();
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

  //method to handle "Add to diet" button click
  void addToDietClicked() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // Save the total calories with the current date to Hive
    totalCaloriesBox.put(currentDate, TotalCalories(calculateTotalCalories()));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue[100]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "History of added food items",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
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
                            selectedFoodItem.foodItem.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Quantity: ${selectedFoodItem.quantity}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.green[700],
                              onPressed: () {
                                setState(() {
                                  selectedItems[index].quantity++;
                                });
                                updateHive(selectedItems);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove),
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
                              icon: const Icon(Icons.delete),
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: addToDietClicked,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color.fromARGB(255, 236, 34, 84),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ), // Call the modified method
                  child: const Text('Add to diet'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Today's Total Calories: ${calculateTotalCalories()} kcal",
                style: TextStyle(fontSize: 15, color: Colors.red[900]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          FoodItem? selected = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return const SearchFood();
          }));

          if (selected != null) {
            setState(() {
              updateItemQuantity(selected);
            });
          }
        },
        label: const Text('Food'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
