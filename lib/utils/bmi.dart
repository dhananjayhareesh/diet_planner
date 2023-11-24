import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/bmi.avif',
                height: 100,
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text('Select Gender: '),
                  DropdownButton<String>(
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    style: TextStyle(color: Colors.blue),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
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
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your weight (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your height (cm)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 16.0),
              Text(
                'BMI: ${bmiResult.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: getColorForBMI(bmiResult)),
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: $resultStatus',
                style:
                    TextStyle(fontSize: 18.0, color: getColorForBMI(bmiResult)),
              ),
              SizedBox(height: 16.0),
              if (bmiResult >= 18.5 && bmiResult < 24.9) ...[
                Text(
                  'Your current weight is within the normal range for BMI.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ] else ...[
                Text(
                  'To achieve a normal weight, consider maintaining weight within the range of BMI 18.5 to 24.9.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ],
            ],
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
