import 'package:todo_list_provider/app/models/task_model.dart';

class WeekTaskModel {
  DateTime startDSate;
  DateTime endDSate;
  List<TaskModel> tasks;
  WeekTaskModel({
    required this.startDSate,
    required this.endDSate,
    required this.tasks,
  });
}
