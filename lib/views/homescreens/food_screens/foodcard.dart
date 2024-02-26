import 'package:dietplanner_project/database/db_waterintake.dart';
import 'package:dietplanner_project/views/homescreens/bmi.dart';
import 'package:dietplanner_project/views/homescreens/food_screens/selected_food.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int glassesConsumed = 0;

  @override
  void initState() {
    super.initState();
    _loadWaterIntake();
  }

  void _loadWaterIntake() async {
    var waterIntakeBox = Hive.box<WaterIntakeModel>('waterbox');
    var currentDate = DateTime.now().toLocal().toString().split(' ')[0];

    // Retrieve the WaterIntakeModel for the current date
    var waterIntake = waterIntakeBox.get(currentDate,
        defaultValue: WaterIntakeModel(0, currentDate));

    // Check if the stored date is not equal to the current date
    if (waterIntake?.date != currentDate) {
      // It's a new day, reset glassesConsumed to 0
      glassesConsumed = 0;
      // Save the reset value to Hive
      _saveWaterIntake();
    } else {
      // Update the glassesConsumed value with the stored value
      setState(() {
        glassesConsumed = waterIntake?.glassesConsumed ?? 0;
      });
    }
  }

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
              child: Image.asset('assets/water.png'),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 35),
              child: Text(
                'Track Your Water\nIntake',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Row(
            children: [
              Text(
                '$glassesConsumed glasses consumed',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    glassesConsumed =
                        (glassesConsumed - 1).clamp(0, double.infinity).toInt();
                    _saveWaterIntake();
                  });
                },
                child: SizedBox(
                  height: 25,
                  width: 30,
                  child: Image.asset('assets/minus.png'),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      glassesConsumed++;
                      _saveWaterIntake();
                    });
                  },
                  child: SizedBox(
                    height: 25,
                    width: 30,
                    child: Image.asset('assets/plus.png'),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // Function to save water intake to Hive
  void _saveWaterIntake() async {
    var waterIntakeBox = Hive.box<WaterIntakeModel>('waterbox');
    var currentDate = DateTime.now().toLocal().toString().split(' ')[0];

    // Retrieve or create a WaterIntakeModel for the current date
    var waterIntake = waterIntakeBox.get(currentDate,
        defaultValue: WaterIntakeModel(0, currentDate));

    // Update the glassesConsumed value if waterIntake is not null
    waterIntake?.glassesConsumed = glassesConsumed;

    // Save the updated WaterIntakeModel to Hive
    await waterIntakeBox.put(currentDate, waterIntake!);
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
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 100,
                  child: Image.asset('assets/break.png'),
                ),
                const Spacer(),
                const Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddFood(
                              appBarTitle: 'Breakfast',
                              appBarColor: Colors.deepPurple,
                            ),
                          ),
                        );
                      },
                      child: Image.asset('assets/plus-sign.png'),
                    ),
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
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 100,
                  child: Image.asset('assets/lunch.png'),
                ),
                const Spacer(),
                const Text(
                  'Lunch',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddFood(
                              appBarTitle: 'Lunch',
                              appBarColor: Colors.green,
                            ),
                          ),
                        );
                      },
                      child: Image.asset('assets/plus-sign.png'),
                    ),
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
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 100,
                  child: Image.asset('assets/snacks.png'),
                ),
                const Spacer(),
                const Text(
                  'Snacks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddFood(
                              appBarTitle: 'Snacks',
                              appBarColor: Colors.orange,
                            ),
                          ),
                        );
                      },
                      child: Image.asset('assets/plus-sign.png'),
                    ),
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
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 100,
                  child: Image.asset('assets/dinner.png'),
                ),
                const Spacer(),
                const Text(
                  'Dinner',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddFood(
                              appBarTitle: 'Dinner',
                              appBarColor: Colors.red,
                            ),
                          ),
                        );
                      },
                      child: Image.asset('assets/plus-sign.png'),
                    ),
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
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: const WaterTracker(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 144, 202, 249),
                  Color.fromARGB(255, 78, 123, 182)
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'BMI',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 63, 111),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BmiScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Text(
                      'Calculate Now',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
