import 'package:dietplanner_project/screens/add_food.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/bfast.jpg')),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                    height: 25,
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddFood(
                                    appBarTitle: 'Breakfast',
                                    appBarColor: Colors.deepPurple,
                                  )));
                        },
                        child: Image.asset('assets/plus-sign.png')))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/lunch.jpg')),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Lunch',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 60,
                ),
                SizedBox(
                    height: 25,
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddFood(
                                    appBarTitle: 'Lunch',
                                    appBarColor: Colors.green,
                                  )));
                        },
                        child: Image.asset('assets/plus-sign.png')))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/snacks.jpg')),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Snacks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                    height: 25,
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddFood(
                                    appBarTitle: 'Snacks',
                                    appBarColor: Colors.yellow,
                                  )));
                        },
                        child: Image.asset('assets/plus-sign.png')))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 100,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/dinner.jpg')),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  'Dinner',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 55,
                ),
                SizedBox(
                    height: 25,
                    width: 30,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddFood(
                                    appBarTitle: 'Dinner',
                                    appBarColor: Colors.red,
                                  )));
                        },
                        child: Image.asset('assets/plus-sign.png')))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 150,
          child: Card(
            elevation: 4,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/water.jpg')),
                    const SizedBox(
                      width: 50,
                    ),
                    const Text(
                      'Track Your Water\nIntake',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Row(
                    children: [
                      const Text(
                        '0 glasses consumed',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                          height: 25,
                          width: 30,
                          child: Image.asset('assets/minus.png')),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                          height: 25,
                          width: 30,
                          child: Image.asset('assets/plus.png'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: Card(
              elevation: 4,
              color: Colors.blue[200],
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Calculate',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Your',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'BMI',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 4, 63, 111),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {},
                          child: const Text('Calculate Now')),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
