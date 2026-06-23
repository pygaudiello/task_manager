//Validar jaja quais informações preciso

class Task {
  String title;
  String description;
  DateTime createdAt;
  bool completed;
  Task({
    required this.title,
    required this.description,
    required this.createdAt,
    this.completed = false,
    // Coloquei como falso, pois a documentação diz:
    // **Tarefa Inicial:** Toda nova tarefa é criada com status **"Em Progresso"**
  });
}
