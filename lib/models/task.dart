enum TaskStatus {
  inProgress,
  completed,
}

class Task {
  String title;
  String description;
  DateTime createdAt;
  TaskStatus status;

  Task({
    required this.title,
    required this.description,
    required this.createdAt,
    this.status = TaskStatus.inProgress,
  });
}