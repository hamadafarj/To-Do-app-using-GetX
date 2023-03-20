import 'package:getx_todo/app/data/models/tasks.dart';
import 'package:getx_todo/app/data/providers/tasks/providers.dart';

class TaskRepository {
  TaskProviders taskProviders;

  TaskRepository({required this.taskProviders});

  List<Task> readTasks() => taskProviders.readTasks();

  void writeTasks(List<Task> tasks) => taskProviders.writeTasks(tasks);
}
