import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/screens/opening_sceens/calorie_budget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ScreenUserDetails extends StatelessWidget {
  ScreenUserDetails({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();
  final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Column(
                      children: [
                        Text(
                          'ADD YOUR',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'DETAILS',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "NAME",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'AGE',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          Text(
                            'SEX',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                labelText: "Age",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          SizedBox(
                            width: 130,
                            child: TextField(
                              controller: sexController,
                              decoration: InputDecoration(
                                labelText: "Sex",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'WEIGHT',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                          ),
                          Text(
                            'HEIGHT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: TextField(
                              controller: weightController,
                              decoration: InputDecoration(
                                labelText: "Weight",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          SizedBox(
                            width: 130,
                            child: TextField(
                              controller: heightController,
                              decoration: InputDecoration(
                                labelText: "Height",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Text(
                          'TARGET WEIGHT',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: TextField(
                          controller: targetWeightController,
                          decoration: InputDecoration(
                            labelText: "Target Height",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //save user data to hive
                            //var userBox = Hive.box('userBox');
                            var user = UserModel()
                              ..name = nameController.text
                              ..age = int.parse(ageController.text)
                              ..sex = sexController.text
                              ..height = double.parse(heightController.text)
                              ..weight = double.parse(weightController.text)
                              ..targetWeight =
                                  double.parse(targetWeightController.text);

                            user.calorieBudget = calculateCalorieBudget(
                                user.weight,
                                user.height,
                                user.targetWeight,
                                user.age,
                                user.sex);

                            userBox.put('user', user);
                            print('User data saved to Hive');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CalorieBudget(
                                user: user,
                              );
                            }));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 4, 63, 111),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  double calculateCalorieBudget(
      double weight, double height, double targetWeight, int age, String sex) {
    // Realistic Harris-Benedict Equation for calculating Basal Metabolic Rate (BMR)
    double bmr;
    if (sex.toLowerCase() == 'male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    // Assuming a moderate activity level
    double calorieBudget = bmr * 1.55; // Adjust activity factor as needed

    // Round the result to the nearest whole number
    calorieBudget = calorieBudget.roundToDouble();

    return calorieBudget;
  }
}
