import 'package:todo_list_provider/app/models/task_model.dart';

abstract class TaskRepository {
  Future<void> save(DateTime data, String description);

  Future<List<TaskModel>> findByPeriod(
    DateTime start,
    DateTime end,
  );
  Future<void> checkOrUncheckTask(TaskModel task);
  Future<void> removeTask(int id);
}
