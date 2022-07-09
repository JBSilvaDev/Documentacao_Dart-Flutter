import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_drawer.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_filters.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_header.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_tasks.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_week.dart';
import 'package:todo_list_provider/app/modules/tasks/task_module.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;
  HomePage({Key? key, required HomeController homeController})
      : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
        context: context,
        successCallback: (notifier, listenerIstance) {
          listenerIstance.dispose();
        });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._homeController.loadTotalTasks();
      widget._homeController.findTasks(filter: TaskFilterEnum.today);
    });
  }

  void _goToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation =
              CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/task/create', context);
        }));
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: context.primaryBackgroundColor,
        elevation: 0,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              widget._homeController.showOrHideFinishingTasks();
            },
            icon: Icon(Icons.filter_alt, ),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(
                child: Text('${widget._homeController.showFinishingTasks ? 'Ocultar' : 'Mostrar'} tarefas concluidas'), 
                value: true,)
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _goToCreateTask(context),
        child: Icon(Icons.add),
        backgroundColor: context.primaryColor,
      ),
      backgroundColor: context.primaryBackgroundColor,
      drawer: HomeDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) => ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: SingleChildScrollView(
            child: Container(
              color: context.primaryBackgroundColor,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: IntrinsicHeight(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeader(),
                  HomeFilters(),
                  HomeWeek(),
                  HomeTasks(),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
