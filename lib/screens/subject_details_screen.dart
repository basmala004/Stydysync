import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stydysync/data/models.dart';
import 'package:stydysync/data/repo.dart';
import 'package:stydysync/wedgits/task_item_common.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final Subject subject;
  const SubjectDetailsScreen({super.key, required this.subject});

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final repo = DataRepository();

  Future<void> _selectDate(BuildContext context, StateSetter setSheetState) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  ColorScheme.light(
              primary: Color(0xFF4E8D9C),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setSheetState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _showAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20, right: 20, top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Add New Task",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: "Task Title")
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _dateController,
                readOnly: true,
                onTap: () => _selectDate(context, setSheetState),
                decoration: const InputDecoration(
                  labelText: "Due Date",
                  suffixIcon: Icon(Icons.calendar_month, color: Color(0xFF4E8D9C)),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4E8D9C),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _dateController.text.isNotEmpty) {
                      setState(() {
                        final newTask = Task(
                          id: DateTime.now().toString(),
                          title: _titleController.text,
                          subjectName: widget.subject.name,
                          date: _dateController.text,
                        );
                        repo.addTask(newTask);
                      });
                      _titleController.clear();
                      _dateController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("ADD TASK"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.subject.name,
          child: Material(
            color: Colors.transparent,
            child: Text(
                widget.subject.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
            ),
          ),
        ),
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
              color:  Color(0xFF4E8D9C),
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
                    title: task.title,
                    date: task.date,
                    isCompleted: task.isDone,
                    onChanged: (val) {
                      setState(() {
                        task.isDone = val!;
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
        backgroundColor: const Color(0xFF4E8D9C),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


