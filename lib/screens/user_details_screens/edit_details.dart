// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dietplanner_project/database/db_model.dart';
import 'package:hive_flutter/adapters.dart';

class EditDetails extends StatefulWidget {
  final UserModel? user;

  const EditDetails({Key? key, this.user}) : super(key: key);

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late String selectedSex; // Updated variable for the selected sex
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController targetWeightController;
  late String selectedActivityLevel;
  late String selectedGoal;

  // Define activityLevels here
  List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
  ];

  // Define sex options here
  List<String> sexOptions = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user?.name ?? '');
    ageController =
        TextEditingController(text: widget.user?.age.toString() ?? '');
    selectedSex = widget.user?.sex ?? ''; // Initialize selectedSex
    weightController =
        TextEditingController(text: widget.user?.weight.toString() ?? '');
    heightController =
        TextEditingController(text: widget.user?.height.toString() ?? '');
    targetWeightController =
        TextEditingController(text: widget.user?.targetWeight.toString() ?? '');
    selectedActivityLevel = widget.user?.activityLevel ?? activityLevels.first;
    selectedGoal = widget.user?.goal ??
        ['Maintain Weight', 'Lose Weight', 'Gain Weight'].first;
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    targetWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Details'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        elevation: 0, // No shadow
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTextField('Name', nameController),
                  buildTextField('Age', ageController, TextInputType.number),
                  buildDropdown('Sex', selectedSex, (value) {
                    setState(() {
                      selectedSex = value.toString();
                    });
                  }, sexOptions),
                  buildTextField(
                      'Weight', weightController, TextInputType.number),
                  buildTextField(
                      'Height', heightController, TextInputType.number),
                  buildTextField('Target Weight', targetWeightController,
                      TextInputType.number),
                  buildDropdown('Activity Level', selectedActivityLevel,
                      (value) {
                    setState(() {
                      selectedActivityLevel = value.toString();
                    });
                  }, activityLevels),
                  buildDropdown('Weight Goal', selectedGoal, (value) {
                    setState(() {
                      selectedGoal = value.toString();
                    });
                  }, ['Maintain Weight', 'Lose Weight', 'Gain Weight']),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final updatedUser = UserModel(
                        name: nameController.text,
                        age: int.tryParse(ageController.text) ?? 0,
                        sex: selectedSex, // Use selectedSex instead of text
                        weight: double.tryParse(weightController.text) ?? 0.0,
                        height: double.tryParse(heightController.text) ?? 0.0,
                        targetWeight:
                            double.tryParse(targetWeightController.text) ?? 0.0,
                        activityLevel: selectedActivityLevel,
                        goal: selectedGoal,
                      );

                      // Recalculate calorie budget
                      updatedUser.calorieBudget = calculateCalorieBudget(
                        updatedUser.weight,
                        updatedUser.height,
                        updatedUser.targetWeight,
                        updatedUser.age,
                        updatedUser.sex,
                        updatedUser.activityLevel,
                        updatedUser.goal,
                      );

                      // Update user details in Hive
                      final userBox = Hive.box<UserModel>('userBox');
                      userBox.put('user', updatedUser);

                      Navigator.of(context).pop(updatedUser);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      [TextInputType? keyboardType]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.indigo),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(
      String label, String value, Function onChanged, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField(
        value: value,
        onChanged: onChanged as void Function(String?)?,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.indigo),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

double calculateCalorieBudget(
    double weight, double height, double targetWeight, int age, String sex,
    [String activityLevel = 'Sedentary', String goal = 'Maintain Weight']) {
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
