import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/views/bottom_nav_screens/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalorieBudget extends StatelessWidget {
  final UserModel user;

  const CalorieBudget({Key? key, required this.user}) : super(key: key);

  Future<void> markFinishButtonClicked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('finishButtonClicked', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/userbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/budget.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Your plan is ready!!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Daily food calorie budget',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                user.calorieBudget.toString(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 250,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      await markFinishButtonClicked();
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainBottom()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 63, 111),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Finish',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
