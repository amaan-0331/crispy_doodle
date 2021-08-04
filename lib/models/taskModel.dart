import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class TaskItem {
  String taskName;
  String taskSubject;
  DateTime taskDeadline;
  Color unitColor;

  TaskItem(
      {required this.taskName,
      required this.taskDeadline,
      required this.taskSubject,
      required this.unitColor});
}

List<TaskItem> sampleTasks = [
  TaskItem(
      taskName: 'Assignment 1',
      taskDeadline: DateTime(2021, 9, 8),
      taskSubject: 'Applications Development',
      unitColor: Colors.redAccent),
  TaskItem(
      taskName: 'Assignment 2',
      taskDeadline: DateTime(2021, 10, 21),
      unitColor: Colors.redAccent,
      taskSubject: 'Applications Development'),
  TaskItem(
      taskName: 'Video Reflection',
      unitColor: Colors.redAccent,
      taskDeadline: DateTime(2021, 10, 27),
      taskSubject: 'Applications Development'),
  TaskItem(
      taskName: 'Online test 1',
      unitColor: Colors.blueAccent,
      taskDeadline: DateTime(2021, 8, 20),
      taskSubject: 'Mobile Applications'),
  TaskItem(
      taskName: 'Online test 2',
      unitColor: Colors.blueAccent,
      taskDeadline: DateTime(2021, 10, 8),
      taskSubject: 'Mobile Applications'),
  TaskItem(
      taskName: 'Case Study',
      unitColor: Colors.blueAccent,
      taskDeadline: DateTime(2021, 9, 13),
      taskSubject: 'Mobile Applications'),
  TaskItem(
      taskName: 'Project',
      unitColor: Colors.blueAccent,
      taskDeadline: DateTime(2021, 10, 18),
      taskSubject: 'Mobile Applications'),
];

class AddTask extends StatelessWidget {
  final String taskName;
  final String taskSubject;
  final DateTime taskDeadline;

  AddTask(this.taskName, this.taskDeadline, this.taskSubject);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('tasks');

    Future<void> addTask() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'taskName': taskName, // John Doe
            'taskSubject': taskSubject, // Stokes and Sons
            'taskDeadline': taskDeadline // 42
          })
          .then((value) => print("Task Added"))
          .catchError((error) => print("Failed to add task: $error"));
    }

    return ElevatedButton(
      style: ButtonStyle(),
      onPressed: addTask,
      child: Text(
        "Add Task",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }
}
