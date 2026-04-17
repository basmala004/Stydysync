import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stydysync/screens/subject_details_screen.dart';
import 'package:stydysync/screens/subject_model.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Subject> subjects = [
      Subject(name: 'Mathematics', tasks: [
        {'title': 'Calculus HW', 'date': 'Today', 'isDone': true},
        {'title': 'Algebra Quiz', 'date': 'Tomorrow', 'isDone': false},
      ]),
      Subject(name: 'Physics',  tasks: [
        {'title': 'ch2 HW', 'date': 'Today', 'isDone': true},
        {'title': 'ch5 Quiz', 'date': 'Tomorrow', 'isDone': false},]),
      Subject(name: 'Chemistry',  tasks: [
        {'title': 'organic HW', 'date': 'Today', 'isDone': true},
        {'title': 'ch8 Quiz', 'date': 'Tomorrow', 'isDone': false},
        {'title': 'ch6 rev', 'date': 'Tomorrow', 'isDone': false},
      ]),
      Subject(name: 'Biology',  tasks: [
        {'title': 'ch4 HW', 'date': 'Today', 'isDone': true},
        {'title': 'ch3, ch5 rev', 'date': 'Tomorrow', 'isDone': false},
      ]),
    ];


    return Scaffold(
      backgroundColor:  Color(0xFFF8F9FA),
      appBar: AppBar(
        title:  Text("Subjects", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding:  EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final sub = subjects[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubjectDetailsScreen(subject: sub)),
            ),
            child: Container(
              margin:  EdgeInsets.only(bottom: 16),
              padding:  EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:  Color(0xFFD9E2E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sub.name, style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                   SizedBox(height: 4),
                  Text("${sub.tasks.length} tasks",
                      style:  TextStyle(color: Color(0xFF547792))),
                   SizedBox(height: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: sub.progress,
                      minHeight: 8,
                      backgroundColor: Colors.white,
                      color:  Color(0xFF547792),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

