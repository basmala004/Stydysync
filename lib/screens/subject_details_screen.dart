import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stydysync/screens/subject_model.dart';
import 'package:stydysync/wedgits/task_item_common.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final Subject subject;
  const SubjectDetailsScreen({super.key, required this.subject});

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name, style:  TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
             SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Progress", style: TextStyle(fontSize: 16)),
                Text("${(widget.subject.progress * 100).toInt()}%"),
              ],
            ),
             SizedBox(height: 10),
            LinearProgressIndicator(
              value: widget.subject.progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
              color:  Color(0xFF547792),
              backgroundColor: Colors.grey.shade200,
            ),
             SizedBox(height: 30),
            Expanded(
              child: widget.subject.tasks.isEmpty
                  ?  Center(child: Text("No tasks for this subject yet."))
                  : ListView.builder(
                itemCount: widget.subject.tasks.length,
                itemBuilder: (context, index) {
                  final task = widget.subject.tasks[index];
                  return TaskItemCommon(
                    subject: widget.subject.name,
                    title: task['title'],
                    date: task['date'],
                    isCompleted: task['isDone'],
                    onChanged: (val) {
                      setState(() {
                        task['isDone'] = val;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


