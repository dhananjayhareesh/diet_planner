import 'package:dietplanner_project/database/model_food.dart';
import 'package:dietplanner_project/views/homescreens/food_screens/updated_addfood.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  late Box<FoodItem> foodBox; // Declare a Hive box for FoodItem

  List<FoodItem> foodItems = [];
  List<FoodItem> filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    foodBox = Hive.box<FoodItem>('foodBox'); // Open the Hive box

    // Add some initial food items
    _addInitialFoodItems();

    // Retrieve existing food items from the Hive box
    foodItems = List.from(foodBox.values);

    // Initialize filteredFoodItems with all food items initially
    filteredFoodItems = List.from(foodItems);
  }

  // Add initial food items to the list
  void _addInitialFoodItems() {
    foodBox.put(0, FoodItem(name: "Apple", calories: 52));
    foodBox.put(1, FoodItem(name: "Banana", calories: 105));
    foodBox.put(2, FoodItem(name: "Orange", calories: 85));
    foodBox.put(3, FoodItem(name: "Grape", calories: 50));
    foodBox.put(4, FoodItem(name: "Rice (cooked)", calories: 150));
    foodBox.put(5, FoodItem(name: "Chapati (Roti)", calories: 80));
    foodBox.put(6, FoodItem(name: "Dal (Cooked Lentils)", calories: 100));
    foodBox.put(7, FoodItem(name: "Chicken Curry", calories: 200));
    foodBox.put(8, FoodItem(name: "Paneer", calories: 250));
    foodBox.put(9, FoodItem(name: "Aloo Gobi", calories: 100));
    foodBox.put(10, FoodItem(name: "Samosa", calories: 300));
    foodBox.put(11, FoodItem(name: "Chicken Biryani", calories: 400));
    foodBox.put(12, FoodItem(name: "Dosa", calories: 50));
    foodBox.put(13, FoodItem(name: "Idli", calories: 50));
    foodBox.put(14, FoodItem(name: "Pakora", calories: 250));
    foodBox.put(15, FoodItem(name: "Tandoori Chicken", calories: 200));
    foodBox.put(16, FoodItem(name: "Vegetable Biryani", calories: 300));
    foodBox.put(17, FoodItem(name: "Butter Chicken", calories: 400));
    foodBox.put(18, FoodItem(name: "Palak Paneer", calories: 200));
    foodBox.put(19, FoodItem(name: "Steamed Broccoli", calories: 55));
    foodBox.put(20, FoodItem(name: "Salmon (Grilled)", calories: 206));
    foodBox.put(21, FoodItem(name: "Quinoa (Cooked)", calories: 120));
    foodBox.put(22, FoodItem(name: "Avocado", calories: 160));
    foodBox.put(23, FoodItem(name: "Sweet Potato (Baked)", calories: 90));
    foodBox.put(24, FoodItem(name: "Oats (Cooked)", calories: 71));
    foodBox.put(25, FoodItem(name: "Greek Yogurt", calories: 59));
    foodBox.put(26, FoodItem(name: "Egg (Boiled)", calories: 68));
    foodBox.put(27, FoodItem(name: "Almonds", calories: 576));
    foodBox.put(28, FoodItem(name: "Spinach (Raw)", calories: 23));
    foodBox.put(29, FoodItem(name: "Tomato (Raw)", calories: 18));
    foodBox.put(30, FoodItem(name: "Chicken Breast (Grilled)", calories: 165));
    foodBox.put(31, FoodItem(name: "Brown Rice (Cooked)", calories: 112));
    foodBox.put(32, FoodItem(name: "Cucumber (Raw)", calories: 16));
    foodBox.put(33, FoodItem(name: "Carrot (Raw)", calories: 41));
    foodBox.put(34, FoodItem(name: "Strawberries", calories: 32));
    foodBox.put(35, FoodItem(name: "Mango", calories: 60));
    foodBox.put(36, FoodItem(name: "Cottage Cheese", calories: 98));
    foodBox.put(37, FoodItem(name: "Peanut Butter", calories: 588));
    foodBox.put(38, FoodItem(name: "Ground Turkey (Cooked)", calories: 165));
    foodBox.put(39, FoodItem(name: "Poha", calories: 70));
    foodBox.put(40, FoodItem(name: "Upma", calories: 130));
    foodBox.put(41, FoodItem(name: "Maggi Noodles", calories: 188));
    foodBox.put(42, FoodItem(name: "Chole Bhature", calories: 450));
    foodBox.put(43, FoodItem(name: "Pakistani Biryani", calories: 330));
    foodBox.put(44, FoodItem(name: "Vada Pav", calories: 300));
    foodBox.put(45, FoodItem(name: "Rajma Chawal", calories: 150));
    foodBox.put(46, FoodItem(name: "Bhindi Masala", calories: 33));
    foodBox.put(47, FoodItem(name: "Dhokla", calories: 180));
    foodBox.put(48, FoodItem(name: "Samosa Chaat", calories: 250));
    foodBox.put(49, FoodItem(name: "Bread Pakora", calories: 200));
    foodBox.put(50, FoodItem(name: "Fried Rice", calories: 218));
    foodBox.put(51, FoodItem(name: "Aloo Paratha", calories: 200));
    foodBox.put(52, FoodItem(name: "Paneer Tikka", calories: 200));
    foodBox.put(53, FoodItem(name: "Fruit Salad", calories: 30));
    foodBox.put(54, FoodItem(name: "Masala Dosa", calories: 150));
    foodBox.put(55, FoodItem(name: "Idiyappam", calories: 100));
    foodBox.put(56, FoodItem(name: "Egg Curry", calories: 180));
    foodBox.put(57, FoodItem(name: "Chicken Korma", calories: 250));
    foodBox.put(58, FoodItem(name: "Bhel Puri", calories: 180));
    foodBox.put(59, FoodItem(name: "Rasgulla", calories: 186));
    foodBox.put(60, FoodItem(name: "Chapati Roll with Chicken", calories: 220));
    foodBox.put(61, FoodItem(name: "Cheese Sandwich", calories: 250));
    foodBox.put(62, FoodItem(name: "Rava Dosa", calories: 160));
    foodBox.put(63, FoodItem(name: "Misal Pav", calories: 300));
    foodBox.put(64, FoodItem(name: "Dhansak", calories: 100));
    foodBox.put(65, FoodItem(name: "Tuna Sandwich", calories: 200));
    foodBox.put(66, FoodItem(name: "Pav Bhaji", calories: 120));
    foodBox.put(67, FoodItem(name: "Chicken Fried Rice", calories: 250));
    foodBox.put(68, FoodItem(name: "Cheese Pizza", calories: 285));
    foodBox.put(69, FoodItem(name: "Cabbage Sabzi", calories: 30));
    foodBox.put(70, FoodItem(name: "Vegetable Spring Roll", calories: 150));
    foodBox.put(71, FoodItem(name: "Palak Puri", calories: 100));
    foodBox.put(72, FoodItem(name: "Masoor Dal", calories: 116));
    foodBox.put(73, FoodItem(name: "Jalebi", calories: 150));
    foodBox.put(74, FoodItem(name: "Kathi Roll", calories: 300));
    foodBox.put(75, FoodItem(name: "Cornflakes", calories: 357));
    foodBox.put(76, FoodItem(name: "Pancakes", calories: 227));
    foodBox.put(77, FoodItem(name: "Chicken Noodles", calories: 200));
    foodBox.put(78, FoodItem(name: "Vegetable Bonda", calories: 120));
    foodBox.put(79, FoodItem(name: "Kaju Katli", calories: 500));
    foodBox.put(80, FoodItem(name: "Chapati with Dal", calories: 150));
    foodBox.put(81, FoodItem(name: "Rice Pudding", calories: 180));
    foodBox.put(82, FoodItem(name: "French Fries", calories: 365));
    foodBox.put(83, FoodItem(name: "Ragi Dosa", calories: 87));
    foodBox.put(84, FoodItem(name: "Tandoori Roti", calories: 260));
    foodBox.put(85, FoodItem(name: "Chicken 65", calories: 300));
    foodBox.put(86, FoodItem(name: "Mushroom Biryani", calories: 150));
    foodBox.put(87, FoodItem(name: "Pumpkin Curry", calories: 26));
    foodBox.put(88, FoodItem(name: "Diet Coke", calories: 0));
    foodBox.put(89, FoodItem(name: "Lemon Rice", calories: 150));
    foodBox.put(90, FoodItem(name: "Cauliflower Rice", calories: 25));
    foodBox.put(91, FoodItem(name: "Prawn Curry", calories: 120));
    foodBox.put(
        92, FoodItem(name: "Spinach and Mushroom Omelette", calories: 150));
    foodBox.put(93, FoodItem(name: "Mixed Vegetable Stir-Fry", calories: 80));
    foodBox.put(94, FoodItem(name: "Chicken Shawarma", calories: 250));
    foodBox.put(95, FoodItem(name: "Chia Pudding", calories: 120));
    foodBox.put(96, FoodItem(name: "Gulab Jamun", calories: 150));
    foodBox.put(97, FoodItem(name: "Raita", calories: 60));
    foodBox.put(98, FoodItem(name: "Fish Tacos", calories: 200));
    foodBox.put(99, FoodItem(name: "Hummus with Pita Bread", calories: 150));
    foodBox.put(100, FoodItem(name: "Barbecue Ribs", calories: 300));
    foodBox.put(101, FoodItem(name: "Mango Lassi", calories: 150));
    foodBox.put(102, FoodItem(name: "Beetroot Salad", calories: 40));
    foodBox.put(103, FoodItem(name: "Shrimp Scampi", calories: 200));
    foodBox.put(104, FoodItem(name: "Pumpkin Pie", calories: 300));
    foodBox.put(105, FoodItem(name: "Caramel Popcorn", calories: 150));
    foodBox.put(106, FoodItem(name: "Chicken Caesar Salad", calories: 200));
    foodBox.put(107, FoodItem(name: "Baked Ziti", calories: 250));
    foodBox.put(108, FoodItem(name: "Tiramisu", calories: 200));
    foodBox.put(109, FoodItem(name: "Chocolate Chip Cookies", calories: 50));
    foodBox.put(110, FoodItem(name: "Pesto Pasta", calories: 180));
    foodBox.put(111, FoodItem(name: "Teriyaki Chicken Bowl", calories: 300));
    foodBox.put(112, FoodItem(name: "Eggplant Parmesan", calories: 150));
    foodBox.put(113, FoodItem(name: "Pumpkin Soup", calories: 80));
    foodBox.put(114, FoodItem(name: "Cranberry Sauce", calories: 80));
    foodBox.put(115, FoodItem(name: "Garlic Bread", calories: 200));
    foodBox.put(116, FoodItem(name: "Coconut Curry Chicken", calories: 250));
    foodBox.put(117, FoodItem(name: "Lobster Bisque", calories: 150));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        title: const Text('Select Your Food'),
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        filterFoodItems(value);
                      },
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search your food",
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: filteredFoodItems.isEmpty
                  ? const Center(
                      child: Text(
                        "No food items found, please create new food",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: filteredFoodItems.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final foodItem = filteredFoodItems[index];
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foodItem.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context, foodItem);
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                "Calories: ${foodItem.calories} kcal",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                backgroundColor: const Color.fromARGB(255, 236, 34, 84),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () async {
                final newFoodItem = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFoodScreen(),
                  ),
                );

                if (newFoodItem != null) {
                  setState(() {
                    foodItems.add(newFoodItem);
                    filterFoodItems(""); // Refresh the filtered list

                    // Save the updated list to the Hive box
                    foodBox.put(foodBox.length, newFoodItem);
                  });
                }
              },
              child: const Text(
                "Create New Food",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void filterFoodItems(String query) {
    setState(() {
      filteredFoodItems = foodItems
          .where((foodItem) =>
              foodItem.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
