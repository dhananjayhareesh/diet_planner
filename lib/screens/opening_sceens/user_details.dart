import 'package:dietplanner_project/screens/opening_sceens/calorie_budget.dart';
import 'package:flutter/material.dart';

class ScreenUserDetails extends StatelessWidget {
  const ScreenUserDetails({super.key});

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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CalorieBudget();
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
}
