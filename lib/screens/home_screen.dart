import 'package:dietplanner_project/database/db_model.dart';
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

  @override
  void initState() {
    super.initState();
    // Fetch user data from Hive when the widget initializes
    user =
        Hive.box<UserModel>('userBox').get('user', defaultValue: UserModel())!;
  }

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.person_2_rounded)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_month))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 34, 141, 230),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
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
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            style: TextStyle(
                              color: Color.fromARGB(255, 251, 249, 249),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircularPercentIndicator(
                        radius: 75,
                        lineWidth: 12,
                        percent: 0.6,
                        progressColor: const Color.fromARGB(255, 25, 88, 196),
                        backgroundColor:
                            const Color.fromARGB(255, 162, 224, 238),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              user.calorieBudget.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Cals Reamaining',
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
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 60),
                          child: Text(
                            'Consumed',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Total',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
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
                              child: Image.asset('assets/fire.png')),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '0 Cals',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset('assets/fire.png')),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            user.calorieBudget.toString(),
                            style: TextStyle(color: Colors.white),
                          )
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
    );
  }
}
