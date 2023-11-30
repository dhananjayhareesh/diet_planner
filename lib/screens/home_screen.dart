import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:dietplanner_project/utils/foodcard.dart';
import 'package:dietplanner_project/utils/user_page.dart';
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

    print('Total Calories from Hive: $totalCalories');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        centerTitle: true,
        title: const Text(
          'HAPPY DIET.',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserPage()));
          },
          icon: const Icon(Icons.person_2_rounded),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            Text(
                              'Welcome, ${user.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            Text(
                              DateFormat('dd-MM-yyyy').format(DateTime.now()),
                              style: TextStyle(
                                color: Color.fromARGB(255, 251, 249, 249),
                              ),
                            ),
                            SizedBox(
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
                          progressColor: const Color.fromARGB(255, 25, 88, 196),
                          backgroundColor:
                              const Color.fromARGB(255, 162, 224, 238),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (((user.calorieBudget ?? 0) - totalCalories) < 0
                                        ? 0
                                        : (user.calorieBudget ?? 0) -
                                            totalCalories)
                                    .toStringAsFixed(0),
                                // Display remaining calories
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: const Row(
                          children: [
                            Text(
                              'Consumed',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              'Total',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
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
