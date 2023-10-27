import 'package:flutter/material.dart';

class NewFood extends StatefulWidget {
  const NewFood({super.key});

  @override
  State<NewFood> createState() => _NewFoodState();
}

class _NewFoodState extends State<NewFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 229, 224, 224),
                ),
                height: 100,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 59,
                        width: 59,
                        child: Image.asset('assets/diet.png')),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Create a food")
                  ],
                ),
              )),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color.fromARGB(255, 229, 224, 224),
              child: Center(
                child: Text(
                  'Food Name',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "ex. Chicken Soup",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color.fromARGB(255, 229, 224, 224),
              child: Center(
                child: Text(
                  'Quantity',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: const Color.fromARGB(255, 229, 224, 224),
              child: Center(
                child: Text(
                  'Energy',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "ex. 120 kcal",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
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
