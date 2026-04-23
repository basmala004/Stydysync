import 'package:stydysync/data/models.dart';

class DataRepository {
  static final DataRepository _instance = DataRepository._internal();
  factory DataRepository() => _instance;
  DataRepository._internal();

  final List<Task> allTasks = [
    Task(id: '1', title: 'Complete Calculus Assignment', subjectName: 'Mathematics', date: '15/4/2026'),
    Task(id: '2', title: 'Algebra Quiz', subjectName: 'Mathematics', date: '23/4/2026'),
    Task(id: '3', title: 'ch2 HW', subjectName: 'Physics', date: '13/12/2026'),
    Task(id: '4', title: 'Revise Chapter 1', subjectName: 'Chemistry', date: '15/4/2026'),
  ];

  List<Subject> get subjects {
    final Map<String, List<Task>> grouped = {};
    for (var task in allTasks) {
      grouped.putIfAbsent(task.subjectName, () => []).add(task);
    }
    return grouped.entries.map((e) => Subject(name: e.key, tasks: e.value)).toList();
  }

  double get totalProgress {
    if (allTasks.isEmpty) return 0.0;
    return allTasks.where((t) => t.isDone).length / allTasks.length;
  }
}