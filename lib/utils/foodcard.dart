import 'package:dietplanner_project/utils/bmi.dart';
import 'package:dietplanner_project/utils/selected_food.dart';
import 'package:flutter/material.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int glassesConsumed = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/water.jpg'),
            ),
            const SizedBox(
              width: 50,
            ),
            const Text(
              'Track Your Water\nIntake',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Row(
            children: [
              Text(
                '$glassesConsumed glasses consumed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    glassesConsumed =
                        (glassesConsumed - 1).clamp(0, double.infinity).toInt();
                  });
                },
                child: SizedBox(
                  height: 25,
                  width: 30,
                  child: Image.asset('assets/minus.png'),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    glassesConsumed++;
                  });
                },
                child: SizedBox(
                  height: 25,
                  width: 30,
                  child: Image.asset('assets/plus.png'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 85,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/break.jpg'),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 25,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddFood(
                            appBarTitle: 'Breakfast',
                            appBarColor: Colors.deepPurple,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/plus-sign.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/lunch.jpg'),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Lunch',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 60,
                ),
                SizedBox(
                  height: 25,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddFood(
                            appBarTitle: 'Lunch',
                            appBarColor: Colors.green,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/plus-sign.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/snacks.jpg'),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Snacks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 25,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddFood(
                            appBarTitle: 'Snacks',
                            appBarColor: Colors.orange,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/plus-sign.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 80,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/dinner.jpg'),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Dinner',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 55,
                ),
                SizedBox(
                  height: 25,
                  width: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddFood(
                            appBarTitle: 'Dinner',
                            appBarColor: Colors.red,
                          ),
                        ),
                      );
                    },
                    child: Image.asset('assets/plus-sign.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 150,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: WaterTracker(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 144, 202, 249),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 63, 111),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BmiScreen()));
                      },
                      child: const Text('Calculate Now'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
