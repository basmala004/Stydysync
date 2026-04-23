import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stydysync/data/repo.dart';
import 'package:stydysync/screens/subject_details_screen.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  final repo = DataRepository();
  @override
  Widget build(BuildContext context) {
    final subjects = repo.subjects;

    return Scaffold(
      appBar: AppBar(
        title:  Text("Subjects", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body:subjects.isEmpty
          ? const Center(child: Text("No subjects found."))
          : ListView.builder(
        padding:  EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final sub = subjects[index];
          return Hero(
            tag: sub.name,
            child: GestureDetector(
              onTap:() async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubjectDetailsScreen(subject: sub),
                  ),
                );
                setState(() {});
              },
              child: Material(
                color: Colors.transparent,
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
              ),
            ),
          );
        },
      ),
    );
  }
}

