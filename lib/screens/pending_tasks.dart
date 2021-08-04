import 'package:crispy_doodle/models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendingTasks extends StatefulWidget {
  PendingTasks({Key? key}) : super(key: key);

  @override
  _PendingTasksState createState() => _PendingTasksState();
}

class _PendingTasksState extends State<PendingTasks> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List sortedList = sampleTasks;
    sortedList.sort((a, b) => a.taskDeadline.compareTo(b.taskDeadline));
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: size.height / 25, horizontal: size.width / 30),
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pending Tasks',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Divider(
                height: 20,
                indent: size.width / 10,
                endIndent: size.width / 10,
                color: Colors.grey[800],
              ),
              AddTask('Amaan Ansari', DateTime.now(), 'Applied Project'),
              Expanded(
                child: ListView.builder(
                    itemCount: sampleTasks.length,
                    itemBuilder: (context, index) {
                      return TaskComponent(
                        color: sortedList[index].unitColor,
                        name: sortedList[index].taskName,
                        deadline: sortedList[index].taskDeadline,
                        unit: sortedList[index].taskSubject,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskComponent extends StatelessWidget {
  const TaskComponent(
      {Key? key,
      required this.deadline,
      required this.name,
      required this.unit,
      required this.color})
      : super(key: key);
  final String name;
  final DateTime deadline;
  final String unit;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20),
      elevation: 15,
      color: color,
      borderOnForeground: true,
      child: ListTile(
        leading: Icon(
          Icons.info,
          size: 35,
        ),
        title: Text(
            '$name \nby ${DateFormat('EEE, MMM d, ' 'yyyy').format(deadline)}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
        subtitle: Text(unit,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        isThreeLine: true,
      ),
    );
  }
}
