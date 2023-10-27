import 'package:dietplanner_project/utils/foodcard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {}, icon: const Icon(Icons.person_2_rounded)),
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
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Row(
                        children: [
                          const Text(
                            'Welcome, User Name',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            '27-10 -2023',
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 225, 219, 219)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircularPercentIndicator(
                        radius: 75,
                        lineWidth: 12,
                        percent: 0.4,
                        progressColor: Color.fromARGB(255, 25, 88, 196),
                        backgroundColor: Color.fromARGB(255, 162, 224, 238),
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2,241',
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Row(
                        children: [
                          Container(
                              height: 18,
                              width: 18,
                              child: Image.asset('assets/fire.png')),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0 Cals',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                              height: 18,
                              width: 18,
                              child: Image.asset('assets/fire.png')),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '2241 Cals',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: FoodCard(),
            )
          ],
        ),
      ),
    );
  }
}
