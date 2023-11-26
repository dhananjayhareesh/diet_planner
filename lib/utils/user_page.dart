import 'package:flutter/material.dart';
import 'package:dietplanner_project/database/db_model.dart';
import 'package:dietplanner_project/utils/edit_details.dart';
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
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo[100]!, Colors.blue[100]!],
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
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
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
                            style: TextStyle(
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
                    padding: EdgeInsets.all(15.0),
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
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Divider(
          thickness: 1.5,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
