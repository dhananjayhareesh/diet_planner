// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/views/user_details_screens/edit_details.dart';
import 'package:hive_flutter/adapters.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserModel? user;
  late Box<UserModel> userBox;

  @override
  void initState() {
    super.initState();
    userBox = Hive.box<UserModel>('userBox');
    user = userBox.get('user', defaultValue: UserModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 139, 220),
        title: const Text('Profile'),
        centerTitle: true,
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Tooltip(
                          message: user?.name ?? 'N/A',
                          child: Text(
                            user?.name.toUpperCase() ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        buildDetailRow('Name', user?.name ?? 'N/A'),
                        buildDetailRow('Age', user?.age.toString() ?? 'N/A'),
                        buildDetailRow('Sex', user?.sex ?? 'N/A'),
                        buildDetailRow(
                            'Weight', user?.weight.toString() ?? 'N/A'),
                        buildDetailRow(
                            'Height', user?.height.toString() ?? 'N/A'),
                        buildDetailRow('Target Weight',
                            user?.targetWeight.toString() ?? 'N/A'),
                        buildDetailRow(
                            'Activity Level', user?.activityLevel ?? 'N/A'),
                        buildDetailRow('Goal', user?.goal ?? 'N/A'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final updatedUser = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditDetails(user: user),
                      ),
                    );

                    if (updatedUser != null && updatedUser is UserModel) {
                      userBox.put('user', updatedUser);
                      setState(() {
                        user = updatedUser;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Edit Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Divider(
          thickness: 1.5,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
