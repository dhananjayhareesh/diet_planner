import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/screens/homescreens/food_screens/foodcard.dart';
import 'package:dietplanner_project/screens/user_details_screens/user_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserModel user;
  late Box<TotalCalories> totalCaloriesBox;
  late int totalCalories; // Add a variable to store the total calories

  @override
  void initState() {
    super.initState();
    user =
        Hive.box<UserModel>('userBox').get('user', defaultValue: UserModel())!;
    totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');

    // Initialize total calories
    totalCalories = totalCaloriesBox
            .get('totalCalories', defaultValue: TotalCalories(0))
            ?.total ??
        0;

    // Add a listener to the Hive box to update total calories when it changes
    totalCaloriesBox.listenable().addListener(_onTotalCaloriesChanged);
    //reset to 0
    updateTotalCalories();
  }

  // Callback function for total calories changes
  void _onTotalCaloriesChanged() {
    // Retrieve and update total calories
    setState(() {
      totalCalories = totalCaloriesBox
              .get('totalCalories', defaultValue: TotalCalories(0))
              ?.total ??
          0;
    });
  }

  void updateTotalCalories() {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (!totalCaloriesBox.containsKey(currentDate)) {
      // It's a new day, reset total calories
      totalCalories = 0;

      // Update the CircularPercentIndicator widget, possibly using setState
      // Example: totalCaloriesPercent = 0.0; (you'll need to define totalCaloriesPercent)
      // setState(() {
      //   totalCaloriesPercent = 0.0;
      // });
    }
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    totalCaloriesBox.listenable().removeListener(_onTotalCaloriesChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve total calories from Hive
    totalCalories = totalCaloriesBox
            .get('totalCalories', defaultValue: TotalCalories(0))
            ?.total ??
        0;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.blue[500]!, Colors.blue[900]!],
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'HAPPY DIET.',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UserPage()));
          },
          icon: const Icon(Icons.person_2_rounded),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, size: 24),
            onSelected: (value) {
              if (value == 'share') {
                // Handle share action
              } else if (value == 'rate') {
                // Handle rate action
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'share',
                child: Text('Share App'),
              ),
              const PopupMenuItem<String>(
                value: 'rate',
                child: Text('Rate Us'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[100]!, Colors.white],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 34, 141, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 144, 202, 249),
                          Color.fromARGB(255, 64, 119, 192)
                        ],
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Text(
                                'Welcome, ${user.name}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 251, 249, 249),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CircularPercentIndicator(
                            radius: 75,
                            lineWidth: 12,
                            percent: (((user.calorieBudget ?? 0) -
                                        totalCalories) /
                                    (user.calorieBudget ?? 1))
                                .clamp(0.0,
                                    1.0), // Clamp the percentage between 0 and 1 // Calculate the percentage
                            progressColor:
                                const Color.fromARGB(255, 25, 88, 196),
                            backgroundColor:
                                const Color.fromARGB(255, 162, 224, 238),
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (((user.calorieBudget ?? 0) - totalCalories) <
                                              0
                                          ? 0
                                          : (user.calorieBudget ?? 0) -
                                              totalCalories)
                                      .toStringAsFixed(0),
                                  // Display remaining calories
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Cal Remaining',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            children: [
                              Text(
                                'Consumed',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Spacer(),
                              Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: Image.asset('assets/fire.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '$totalCalories Cals', // Updated line
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: Image.asset('assets/fire.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                user.calorieBudget.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: FoodCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
