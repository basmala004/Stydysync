import 'package:stydysync/data/models.dart';

class DataRepository {
  static final DataRepository _instance = DataRepository._internal();
  factory DataRepository() => _instance;
  DataRepository._internal();

  final List<Subject> _subjects = [
    Subject(name: 'Mathematics', tasks: [
      Task(id: '1', title: 'Complete Calculus Assignment', subjectName: 'Mathematics', date: '15/4/2026'),
      Task(id: '2', title: 'Algebra Quiz', subjectName: 'Mathematics', date: '23/4/2026'),
    ]),
    Subject(name: 'Physics', tasks: [
      Task(id: '3', title: 'ch2 HW', subjectName: 'Physics', date: '13/12/2026'),
    ]),
    Subject(name: 'Chemistry', tasks: [
      Task(id: '4', title: 'Revise Chapter 1', subjectName: 'Chemistry', date: '15/4/2026'),

    ]),
  ];


  List<Subject> get subjects => _subjects;

  void addSubject(String name) {
    _subjects.add(Subject(name: name, tasks: []));
  }

  List<Task> get allTasks {
    return _subjects.expand((subject) => subject.tasks).toList();
  }

  double get totalProgress {
    final tasks = allTasks;
    if (tasks.isEmpty) return 0.0;
    int completedCount = tasks.where((t) => t.isDone).length;
    return completedCount / tasks.length;
  }

  void addTask(Task task) {
    final subject = _subjects.firstWhere(
          (s) => s.name == task.subjectName,
      orElse: () {
        final newSub = Subject(name: task.subjectName, tasks: []);
        _subjects.add(newSub);
        return newSub;
      },
    );
    subject.tasks.add(task);
  }
}