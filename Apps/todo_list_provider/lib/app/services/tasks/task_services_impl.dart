import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/models/week_task_model.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_services.dart';

class TaskServicesImpl implements TaskServices {
  final TaskRepository _taskRepository;

  TaskServicesImpl({required TaskRepository taskRepository})
      : _taskRepository = taskRepository;

  @override
  Future<void> save(DateTime data, String description) =>
      _taskRepository.save(data, description);

  @override
  Future<List<TaskModel>> getToday() {
    return _taskRepository.findByPeriod(DateTime.now(), DateTime.now());
  }

  @override
  Future<List<TaskModel>> getTomorrow() {
    var tomorrowDate = DateTime.now().add(Duration(days: 1));
    return _taskRepository.findByPeriod(tomorrowDate, tomorrowDate);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    final today = DateTime.now();
    var startFilter = DateTime(today.year, today.month, today.day, 0, 0, 0);
    DateTime endFilter;

    if (startFilter.weekday != DateTime.monday) {
      startFilter =
          startFilter.subtract(Duration(days: startFilter.weekday - 1));
    }
    endFilter = startFilter.add(Duration(days: 7));

    final tasks = await _taskRepository.findByPeriod(startFilter, endFilter);

    return WeekTaskModel(
        startDSate: startFilter, endDSate: endFilter, tasks: tasks);
  }

  @override
  Future<void> checkOrUncheckTask(TaskModel task) {
    return _taskRepository.checkOrUncheckTask(task);
  }

  @override
  Future<void> removeTask(int id) {
    return _taskRepository.removeTask(id);
  }
}
