import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;
  String resultStatus = '';
  String selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        centerTitle: true,
        title: const Text('BMI Calculator'),
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.blue[100]!],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/bmi.avif',
                  height: 100,
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text('Select Gender: '),
                    DropdownButton<String>(
                      value: selectedGender,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue!;
                        });
                      },
                      style: const TextStyle(color: Colors.blue),
                      icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      items: ['Male', 'Female'].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter your weight (kg)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter your height (cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                  },
                  child: const Text('Calculate BMI'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'BMI: ${bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: getColorForBMI(bmiResult)),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Result: $resultStatus',
                  style: TextStyle(
                      fontSize: 18.0, color: getColorForBMI(bmiResult)),
                ),
                const SizedBox(height: 16.0),
                if (bmiResult >= 18.5 && bmiResult < 24.9) ...[
                  const Text(
                    'Your current weight is within the normal range for BMI.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ] else ...[
                  const Text(
                    'To achieve a normal weight, consider maintaining weight within the range of BMI 18.5 to 24.9.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double heightInMeters = height / 100;
      double bmi;

      if (selectedGender == 'Male') {
        bmi = weight / (heightInMeters * heightInMeters);
      } else {
        bmi = weight / (1.08 * heightInMeters * heightInMeters);
      }

      setState(() {
        bmiResult = bmi;
        resultStatus = getBmiStatus(bmi);
      });
    } else {
      setState(() {
        bmiResult = 0.0;
        resultStatus = 'Invalid input. Please enter valid values.';
      });
    }
  }

  String getBmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  Color getColorForBMI(double bmi) {
    if (bmi >= 18.5 && bmi < 24.9) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
