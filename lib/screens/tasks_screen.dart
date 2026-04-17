import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stydysync/wedgits/task_item_common.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {'subject': 'Math', 'title': 'Complete Calculus Assignment', 'date': 'Tomorrow', 'isDone': false},
    {'subject': 'History', 'title': 'Read Chapter 5', 'date': 'Friday', 'isDone': false},
    {'subject': 'Science', 'title': 'Lab Report on Photosynthesis', 'date': 'Next Week', 'isDone': false},
  ];

  double get _progress {
    if (_tasks.isEmpty) return 0.0;
    int completedCount = _tasks.where((task) => task['isDone'] == true).length;
    return completedCount / _tasks.length;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text("Tasks", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
             SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text("${(_progress * 100).toInt()}%", style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12),

            LinearProgressIndicator(
              value: _progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              color: Color(0xFF547792),
              borderRadius: BorderRadius.circular(10),
            ),

            SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return TaskItemCommon(
                    subject: _tasks[index]['subject'],
                    title: _tasks[index]['title'],
                    date: _tasks[index]['date'],
                    isCompleted: _tasks[index]['isDone'],
                    onChanged: (value) {
                      setState(() {
                        _tasks[index]['isDone'] = value!;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor:  Color(0xFF547792),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );

}}
