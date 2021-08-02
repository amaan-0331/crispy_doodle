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

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
