import 'package:dietplanner_project/database/db_goal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hive_flutter/hive_flutter.dart';

class GoalTrackerScreen extends StatefulWidget {
  const GoalTrackerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoalTrackerScreenState createState() => _GoalTrackerScreenState();
}

class _GoalTrackerScreenState extends State<GoalTrackerScreen> {
  late Box<UserGoal> goalsBox;
  late Box<UserProgress> progressBox;
  late String newGoalTitle;
  late double newGoalTargetValue;
  late String newGoalUnit;
  late double newProgressAchievedValue;

  @override
  void initState() {
    super.initState();
    goalsBox = Hive.box<UserGoal>('goals');
    progressBox = Hive.box<UserProgress>('progress');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Goal Tracker'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.blue[500]!, Colors.blue[900]!],
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[100]!, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Your Goals'),
                _buildGoalsContainer(),
                const SizedBox(height: 16),
                _buildSectionTitle('Your Progress'),
                _buildProgressContainer(),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => _showAddGoalDialog(context),
                  child: const Text('Add Goal'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => _showAddProgressDialog(context),
                  child: const Text('Log Progress'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[900]),
      ),
    );
  }

  Widget _buildGoalsContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<UserGoal>('goals').listenable(),
        builder: (context, Box<UserGoal> box, _) {
          List<UserGoal> goals = box.values.toList();
          return goals.isEmpty
              ? const Center(
                  child: Text(
                    'No goals set yet. Start setting your goals now!',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : Column(
                  children: goals
                      .map(
                        (goal) => Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          color: Colors.blue[50],
                          child: ListTile(
                            title: Text(
                              goal.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Target: ${goal.targetValue} ${goal.unit}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () =>
                                      _showEditGoalDialog(context, goal),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => _deleteGoal(goal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
        },
      ),
    );
  }

  void _showEditGoalDialog(BuildContext context, UserGoal goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Goal',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Goal Title'),
                controller: TextEditingController(text: goal.title),
                onChanged: (value) {
                  setState(() {
                    newGoalTitle = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Target Value'),
                keyboardType: TextInputType.number,
                controller:
                    TextEditingController(text: goal.targetValue.toString()),
                onChanged: (value) {
                  setState(() {
                    newGoalTargetValue = double.parse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Unit'),
                controller: TextEditingController(text: goal.unit),
                onChanged: (value) {
                  setState(() {
                    newGoalUnit = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _editGoal(goal);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editGoal(UserGoal goal) {
    // Implement the logic to edit the goal in the Hive box
    goal.title = newGoalTitle;
    goal.targetValue = newGoalTargetValue;
    goal.unit = newGoalUnit;
    goal.save();
  }

  void _deleteGoal(UserGoal goal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Goal'),
          content: const Text('Have you achieved your goal?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _confirmDeleteGoal(goal);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteGoal(UserGoal goal) {
    // Implement the logic to delete the goal from the Hive box
    goalsBox.delete(goal.key);
  }

  Widget _buildProgressContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ValueListenableBuilder(
        valueListenable: Hive.box<UserProgress>('progress').listenable(),
        builder: (context, Box<UserProgress> box, _) {
          List<UserProgress> progressList = box.values.toList();
          return progressList.isEmpty
              ? const Center(
                  child: Text(
                    'No progress logged yet. Keep working towards your goals!',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : Column(
                  children: progressList
                      .map(
                        (progress) => Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          color: Colors.blue[50],
                          child: ListTile(
                            title: Text(
                              'Progress on ${_formatDate(progress.date)}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            subtitle: Text(
                              'Achieved: ${progress.achievedValue}',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteProgress(progress),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
        },
      ),
    );
  }

  void _deleteProgress(UserProgress progress) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Progress'),
          content: const Text(
              'Are you sure you want to delete this progress entry?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _confirmDeleteProgress(progress);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteProgress(UserProgress progress) {
    // Implement the logic to delete the progress entry from the Hive box
    progressBox.delete(progress.key);
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM d, y - hh:mm a').format(date);
  }

  void _showAddGoalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Goal',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Goal Title'),
                onChanged: (value) {
                  setState(() {
                    newGoalTitle = value;
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Target Value'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    newGoalTargetValue = double.parse(value);
                  });
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Unit'),
                onChanged: (value) {
                  setState(() {
                    newGoalUnit = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveNewGoal();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveNewGoal() {
    UserGoal newGoal = UserGoal(
      DateTime.now().toString(),
      newGoalTitle,
      newGoalTargetValue,
      newGoalUnit,
    );
    goalsBox.add(newGoal);
  }

  void _showAddProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Progress',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Achieved Value'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    newProgressAchievedValue = double.parse(value);
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _saveProgressEntry();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _saveProgressEntry() {
    UserProgress progressEntry = UserProgress(
      goalsBox.values.first.goalId,
      newProgressAchievedValue,
      DateTime.now(),
    );
    progressBox.add(progressEntry);
  }
}
