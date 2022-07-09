import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_provider/app/modules/home/home_page.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';
import 'package:todo_list_provider/app/repositories/tasks/task_repository_impl.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';
import 'package:todo_list_provider/app/services/tasks/task_services_impl.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_services.dart';


class HomeModule extends TodoListModule {
  HomeModule()
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
          ChangeNotifierProvider(create: (context)=>HomeController(taskServices: context.read()))
        ],
          routers: {
            '/home':(context) => HomePage(homeController: context.read(),)
          },
          
        );
}
