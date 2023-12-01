import 'package:dietplanner_project/database/db_waterintake.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenDiary extends StatefulWidget {
  const ScreenDiary({Key? key}) : super(key: key);

  @override
  _ScreenDiaryState createState() => _ScreenDiaryState();
}

class _ScreenDiaryState extends State<ScreenDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Diary'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<TotalCalories>('totalCaloriesBox').listenable(),
          builder: (context, totalCaloriesBox, widget) {
            return ValueListenableBuilder(
              valueListenable:
                  Hive.box<WaterIntakeModel>('waterbox').listenable(),
              builder: (context, waterIntakeBox, widget) {
                return ListView.builder(
                  itemCount:
                      getAllDates().length > 1 ? getAllDates().length - 1 : 0,
                  itemBuilder: (context, index) {
                    String date = getAllDates()[index + 1];
                    int totalCalories = getTotalCaloriesForDate(date);
                    int totalWaterIntake = getTotalWaterIntakeForDate(date);

                    return Container(
                      height: 120,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[700],
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Calorie Intake :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '$totalCalories kcal',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Water Intake   :',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '$totalWaterIntake glasses',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  int getTotalCaloriesForDate(String date) {
    var totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');
    var totalCalories =
        totalCaloriesBox.get(date, defaultValue: TotalCalories(0, date));
    return totalCalories?.total ?? 0;
  }

  int getTotalWaterIntakeForDate(String date) {
    var waterIntakeBox = Hive.box<WaterIntakeModel>('waterbox');
    var waterIntake =
        waterIntakeBox.get(date, defaultValue: WaterIntakeModel(0, date));
    return waterIntake?.glassesConsumed ?? 0;
  }

  List<String> getAllDates() {
    var totalCaloriesBox = Hive.box<TotalCalories>('totalCaloriesBox');
    List<String> allDates = totalCaloriesBox.keys.cast<String>().toList();
    allDates.sort((a, b) => b.compareTo(a));
    return allDates;
  }
}
