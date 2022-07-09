import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';

class RemoveTask extends AlertDialog {
  RemoveTask(BuildContext context, String task, int id)
      : super(
          title: const Text('Deletar Task?'),
          content: Text('$task'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<HomeController>().removeTask(id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Removida a anotação: $task'),
                    ));
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Sim'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
            // SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Não'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ],
        );
}
