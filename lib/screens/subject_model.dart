class Subject {
  final String name;
  final List<Map<String, dynamic>> tasks;

  Subject({
    required this.name,
    required this.tasks,
  });

  double get progress {
    if (tasks.isEmpty) return 0.0;
    int completedCount = tasks.where((task) => task['isDone'] == true).length;
    return completedCount / tasks.length;
  }
}