

class Task {
  final String id;
  final String title;
  final String subjectName;
  final String date;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.subjectName,
    required this.date,
    this.isDone = false,
  });
}

class Subject {
  final String name;
  final List<Task> tasks;

  Subject({required this.name, required this.tasks});

  double get progress {
    if (tasks.isEmpty) return 0.0;
    final completed = tasks.where((t) => t.isDone).length;
    return completed / tasks.length;
  }
}