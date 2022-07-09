import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_page.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository_impl.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';
import 'package:todo_list_provider/app/services/tasks/task_services_impl.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_services.dart';

class TasksModule extends TodoListModule {
  TasksModule()
      : super(
          bindings: [
            Provider<TaskRepository>(
                create: (context) => TaskRepositoryImpl(
                      sqliteConnectionFactory: context.read(),
                    ),
                    ),
            Provider<TaskServices>(
                create: (context) => TaskServicesImpl(
                      taskRepository: context.read(),
                    )),
            ChangeNotifierProvider(
              create: (context) =>
                  TaskCreateController(taskServices: context.read()),
            )
          ],
          routers: {
            '/task/create': (context) => TaskCreatePage(
                  controller: context.read(),
                ),
          },
        );
}
