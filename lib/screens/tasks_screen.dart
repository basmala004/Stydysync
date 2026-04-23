import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stydysync/data/models.dart';
import 'package:stydysync/data/repo.dart';
import 'package:stydysync/wedgits/task_item_common.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final repo = DataRepository();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();

  String _selectedSubject = 'Mathematics';
  DateTime? _pickedDate;


  Future<void> _selectDate(BuildContext context, StateSetter setSheetState) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setSheetState(() {
        _pickedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }


  void _showAddTaskSheet() {
    final subjectNames = repo.subjects.map((s) => s.name).toList();
    if (subjectNames.isEmpty) subjectNames.add("General");

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20, right: 20, top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("New Task", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                value: subjectNames.contains(_selectedSubject) ? _selectedSubject : subjectNames.first,
                decoration: const InputDecoration(labelText: "Select Subject"),
                items: subjectNames.map((n) => DropdownMenuItem(value: n, child: Text(n))).toList(),
                onChanged: (val) => setSheetState(() => _selectedSubject = val!),
              ),

              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: "Task Title"),
              ),

              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Due Date",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context, setSheetState),
              ),

              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4E8D9C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _dateController.text.isNotEmpty) {
                      setState(() {
                        repo.addTask(Task(
                          id: DateTime.now().toString(),
                          title: _titleController.text,
                          subjectName: _selectedSubject,
                          date: _dateController.text,
                        ));
                      });
                      _titleController.clear();
                      _dateController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("SAVE TASK"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // double get _progress {
  //   if (_tasks.isEmpty) return 0.0;
  //   int completedCount = _tasks.where((task) => task['isDone'] == true).length;
  //   return completedCount / _tasks.length;
  // }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
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
                Text("${(repo.totalProgress * 100).toInt()}%", style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 12),

            LinearProgressIndicator(
              value: repo.totalProgress ,
              minHeight: 10,
              backgroundColor: Colors.grey.shade200,
              color: Color(0xFF4E8D9C),
              borderRadius: BorderRadius.circular(10),
            ),

            SizedBox(height: 30),

            Expanded(
              child:ListView.builder(
                itemCount: repo.allTasks.length,
                itemBuilder: (context, index) {
                  final task = repo.allTasks[index];
                  return TaskItemCommon(
                    subject: task.subjectName,
                    title: task.title,
                    date: task.date,
                    isCompleted: task.isDone,
                    onChanged: (value) {
                      setState(() {
                        task.isDone = value!;
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
        onPressed: _showAddTaskSheet,
        backgroundColor:  Color(0xFF4E8D9C),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );

}}
