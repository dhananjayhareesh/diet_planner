import 'package:dietplanner_project/database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var userBox = Hive.box('userBox');
    var userBox = Hive.box<UserModel>('userBox');
    var user = userBox.get('user', defaultValue: UserModel());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.asset('assets/user.png')),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Text(
                    user?.name.toUpperCase() ?? 'N/A',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Details',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.name ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.age.toString() ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Sex',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.sex ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.weight.toString() ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.height.toString() ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Target Weight',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(user?.targetWeight.toString() ?? 'N/A')
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 152, 160, 235),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              child: const Text('Save Changes'),
            )
          ],
        ),
      ),
    );
  }
}
