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
            Container(
              height: 300,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 7, 69, 120),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 70,
                        ),
                        SizedBox(
                          child: Image.asset('assets/leftar.png'),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Text(
                          '14-october-2023',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          child: Image.asset('assets/rightar.png'),
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40, top: 40),
                        child: CircularPercentIndicator(
                          radius: 80,
                          lineWidth: 15,
                          percent: 0.4,
                          progressColor: Color.fromARGB(255, 19, 7, 233),
                          backgroundColor: Color.fromARGB(255, 125, 137, 238),
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
                                'kcal',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              '200',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 05,
                          ),
                          Text(
                            'kcal',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Remaining',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
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
