import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/views/opening_sceens/calorie_budget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ScreenUserDetails extends StatefulWidget {
  const ScreenUserDetails({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScreenUserDetailsState createState() => _ScreenUserDetailsState();
}

class _ScreenUserDetailsState extends State<ScreenUserDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();
  final Box<UserModel> userBox = Hive.box<UserModel>('userBox');

  Map<String, String> errors = {};

  String selectedGoal = 'Maintain Weight'; // Default goal
  List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active'
  ];
  String selectedActivityLevel = 'Sedentary'; // Default activity level

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[100]!, Colors.white],
              ),
            ),

            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/userbg.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              children: [
                Column(
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Text(
                              'ADD YOUR',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'DETAILS',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: nameController,
                                    onChanged: (_) => clearError('name'),
                                    decoration: InputDecoration(
                                      labelText: "Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      errorText: errors['name'],
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setError(
                                            'name', 'Please enter your name');
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: DropdownButtonFormField(
                                    value: sexController.text.isNotEmpty
                                        ? sexController.text
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        sexController.text = value.toString();
                                      });
                                      clearError(
                                          'sex'); // Clear error when a value is selected
                                    },
                                    items: ['Male', 'Female'].map((sex) {
                                      return DropdownMenuItem(
                                        value: sex,
                                        child: Text(
                                          sex,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      labelText: "Sex",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                      errorText: errors['sex'],
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        setError(
                                            'sex', 'Please select your sex');
                                        return 'Please select your sex';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: TextFormField(
                                        controller: ageController,
                                        onChanged: (_) => clearError('age'),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Age",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          errorText: errors['age'],
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            setError(
                                                'age', 'Please enter your age');
                                            return 'Please enter your age';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 60,
                                      width: 150,
                                      child: TextFormField(
                                        controller: heightController,
                                        onChanged: (_) => clearError('height'),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Height(cm)",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          errorText: errors['height'],
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            setError('height',
                                                'Please enter your height');
                                            return 'Please enter your height';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: TextFormField(
                                        controller: weightController,
                                        onChanged: (_) => clearError('weight'),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Weight(kg)",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          errorText: errors['weight'],
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            setError('weight',
                                                'Please enter your weight');
                                            return 'Please enter your weight';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 50,
                                      width: 150,
                                      child: TextFormField(
                                        controller: targetWeightController,
                                        onChanged: (_) =>
                                            clearError('targetWeight'),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Target Weight(kg)",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.black),
                                          ),
                                          errorText: errors['targetWeight'],
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            setError('targetWeight',
                                                'Please enter your target weight');
                                            return 'Please enter your target weight';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'ACTIVITY LEVEL',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: DropdownButtonFormField(
                                    value: selectedActivityLevel,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedActivityLevel =
                                            value.toString();
                                      });
                                    },
                                    items: activityLevels.map((level) {
                                      return DropdownMenuItem(
                                        value: level,
                                        child: Text(
                                          level,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'WEIGHT GOAL',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: DropdownButtonFormField(
                                    value: selectedGoal,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGoal = value.toString();
                                      });
                                    },
                                    items: [
                                      'Maintain Weight',
                                      'Lose Weight',
                                      'Gain Weight'
                                    ].map((goal) {
                                      return DropdownMenuItem(
                                        value: goal,
                                        child: Text(
                                          goal,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black),
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
                                    height: 60,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (validateForm()) {
                                            var user = UserModel()
                                              ..name = nameController.text
                                              ..age =
                                                  int.parse(ageController.text)
                                              ..sex = sexController.text
                                              ..height = double.parse(
                                                  heightController.text)
                                              ..weight = double.parse(
                                                  weightController.text)
                                              ..targetWeight = double.parse(
                                                  targetWeightController.text)
                                              ..activityLevel =
                                                  selectedActivityLevel
                                              ..goal = selectedGoal;

                                            user.calorieBudget =
                                                calculateCalorieBudget(
                                              user.weight,
                                              user.height,
                                              user.targetWeight,
                                              user.age,
                                              user.sex,
                                              user.activityLevel,
                                              user.goal,
                                            );

                                            userBox.put('user', user);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return CalorieBudget(
                                                    user: user,
                                                  );
                                                },
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 4, 63, 111),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: const Text(
                                          'Continue',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateCalorieBudget(
    double weight,
    double height,
    double targetWeight,
    int age,
    String sex,
    String activityLevel,
    String goal,
  ) {
    double bmr;
    if (sex.toLowerCase() == 'male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    double activityMultiplier = 1.0;
    if (activityLevel == 'Sedentary') {
      activityMultiplier = 1.2;
    } else if (activityLevel == 'Lightly Active') {
      activityMultiplier = 1.375;
    } else if (activityLevel == 'Moderately Active') {
      activityMultiplier = 1.55;
    } else if (activityLevel == 'Very Active') {
      activityMultiplier = 1.725;
    }

    if (goal == 'Lose Weight') {
      activityMultiplier -= 0.2;
    } else if (goal == 'Gain Weight') {
      activityMultiplier += 0.2;
    }

    double calorieBudget = bmr * activityMultiplier;
    calorieBudget = calorieBudget.roundToDouble();

    return calorieBudget;
  }

  bool validateForm() {
    bool isValid = true;
    errors = {};

    if (nameController.text.isEmpty) {
      setError('name', 'Please enter your name');
      isValid = false;
    }

    if (ageController.text.isEmpty) {
      setError('age', 'Enter age');
      isValid = false;
    }

    if (sexController.text.isEmpty) {
      setError('sex', 'Please select your sex');
      isValid = false;
    }

    if (weightController.text.isEmpty) {
      setError('weight', 'Enter weight');
      isValid = false;
    }

    if (heightController.text.isEmpty) {
      setError('height', 'Enter height');
      isValid = false;
    }

    if (targetWeightController.text.isEmpty) {
      setError('targetWeight', 'Enter target weight');
      isValid = false;
    }

    setState(() {}); // Update the UI to show error messages

    return isValid;
  }

  void setError(String field, String message) {
    setState(() {
      errors[field] = message;
    });
  }

  void clearError(String field) {
    setState(() {
      errors.remove(field);
    });
  }
}
