import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/task.dart';
import 'create_task_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [];
  
  int get pendingTasks {
    return tasks.where(
      (task) => !task.completed,
    ).length;
  }
  
  String get pendingTasksText {
  if (pendingTasks == 0) {
    return 'Sem tarefas pendentes';
  }
  if (pendingTasks == 1) {
    return '1 tarefa pendente';
  }
  return '$pendingTasks tarefas pendentes';
  }

  Future<void> navigateToCreateTask() async {
    final Task? task = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateTaskScreen(),
      ),
    );

    if (task != null) {
      setState(() {
        tasks.insert(0, task);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,

        title: Text(
          'Minhas Tarefas',
          style: TextStyle(
            color: CustomColors.primary,
            fontSize: Values.fontSize.large!,
            fontWeight: FontWeight.w800,
            backgroundColor: CustomColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          Values.spacing.small!,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                pendingTasksText,
                style: TextStyle(
                  fontSize: Values.fontSize.small,
                  color: CustomColors.fontSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(
              height: Values.spacing.medium,
            ),

            Expanded(
              child: tasks.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma tarefa cadastrada',
                        style: TextStyle(
                          color: CustomColors.fontSecondary,
                          fontSize: Values.fontSize.small!,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                          final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(task.createdAt);

                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Values.spacing.small!,
                          ),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Card(
                                  color: task.completed
                                      ? CustomColors
                                          .cardBackgroundCompleted
                                      : CustomColors.cardBackground,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      Values.spacing.medium!,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          task.title,
                                          style: TextStyle(
                                            fontSize: Values
                                                .fontSize.mediumLarge,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: CustomColors.font,
                                            decoration:
                                                task.completed
                                                    ? TextDecoration
                                                        .lineThrough
                                                    : null,
                                          ),
                                        ),

                                        SizedBox(
                                          height: Values
                                              .spacing.small,
                                        ),

                                        Text(
                                          task.description,
                                          maxLines: 2,
                                          overflow:
                                              TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: Values
                                                  .fontSize.medium,
                                              color: CustomColors.fontMedium,
                                          ),
                                        ),

                                        SizedBox(
                                          height: Values
                                              .spacing.small,
                                        ),

                                        Text(
                                          'Criada em $formattedDate',
                                          style: TextStyle(
                                            fontSize: Values
                                                .fontSize.extraSmall!,
                                            color: CustomColors
                                                .fontSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Checkbox(
                                value: task.completed,
                                onChanged: task.completed
                                    ? null
                                    : (value) {
                                        setState(() {
                                          task.completed = true;
                                        });
                                      },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColors.primary,
        onPressed: navigateToCreateTask,
        child: const Icon(
          Icons.add,
          color: CustomColors.white,
        ),
      ),
    );
  }
}