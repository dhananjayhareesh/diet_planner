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
  late TextEditingController sexController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  late TextEditingController targetWeightController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user?.name ?? '');
    ageController =
        TextEditingController(text: widget.user?.age.toString() ?? '');
    sexController = TextEditingController(text: widget.user?.sex ?? '');
    weightController =
        TextEditingController(text: widget.user?.weight.toString() ?? '');
    heightController =
        TextEditingController(text: widget.user?.height.toString() ?? '');
    targetWeightController =
        TextEditingController(text: widget.user?.targetWeight.toString() ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    sexController.dispose();
    weightController.dispose();
    heightController.dispose();
    targetWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: ageController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: sexController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Sex',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: weightController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Weight',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: heightController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Height',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: targetWeightController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Target Weight',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final updatedUser = UserModel(
                        name: nameController.text,
                        age: int.tryParse(ageController.text) ?? 0,
                        sex: sexController.text,
                        weight: double.tryParse(weightController.text) ?? 0.0,
                        height: double.tryParse(heightController.text) ?? 0.0,
                        targetWeight:
                            double.tryParse(targetWeightController.text) ?? 0.0,
                      );

                      // Recalculate calorie budget
                      updatedUser.calorieBudget = calculateCalorieBudget(
                        updatedUser.weight,
                        updatedUser.height,
                        updatedUser.targetWeight,
                        updatedUser.age,
                        updatedUser.sex,
                      );

                      // Update user details in Hive
                      final userBox = Hive.box<UserModel>('userBox');
                      userBox.put('user', updatedUser);

                      Navigator.of(context).pop(updatedUser);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 152, 160, 235),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double calculateCalorieBudget(
  double weight,
  double height,
  double targetWeight,
  int age,
  String sex,
) {
  double bmr;
  if (sex.toLowerCase() == 'male') {
    bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
  } else {
    bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
  }

  double calorieBudget = bmr * 1.55;

  calorieBudget = calorieBudget.roundToDouble();

  return calorieBudget;
}
