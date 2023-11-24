import 'package:flutter/material.dart';

class ScreenDiary extends StatelessWidget {
  const ScreenDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Diary'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        '18/11/2023',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              'Calorie Intake :',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            '2000 kcal',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(
                              'Water Intake   :',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            '10 Glasses',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
