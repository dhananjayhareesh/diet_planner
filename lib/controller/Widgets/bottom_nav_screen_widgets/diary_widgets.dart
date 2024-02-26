import 'package:dietplanner_project/controller/Functions/diary_utils.dart';
import 'package:dietplanner_project/database/db_waterintake.dart';
import 'package:dietplanner_project/database/model_totalcalories.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DiaryWidget {
  Container mainBodyContainer() {
    return Container(
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

                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[200]!,
                            Colors.blue[100]!,
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                            const SizedBox(height: 12),
                            buildInfoRow(
                                'Calorie Intake', '$totalCalories kcal'),
                            buildInfoRow(
                                'Water Intake', '$totalWaterIntake glasses'),
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
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Your Diary'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 40, 139, 220),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Colors.blue[500]!, Colors.blue[900]!],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
