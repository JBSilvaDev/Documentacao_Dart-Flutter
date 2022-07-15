import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/modules/home/widgets/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widgets/task_remove.dart';

class Task extends StatelessWidget {
  final TaskModel model;

  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('dd/MM/y');
  Task({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey),
          ]),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Dismissible(
        background: Container(
          color: Colors.red,
          child: Row(
            children: [
              Text('Você vai deletar isto! ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(
                width: 20,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (DismissDirection direction) {
          return showDialog(
              context: context,
              builder: (_) {
                final int id = model.id;
                return RemoveTask(context, model.description, id);
              });
        },
        // onResize: null,
        key: _formKey,
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: EdgeInsets.all(8),
            leading: Checkbox(
              onChanged: (value) =>
                  context.read<HomeController>().checkOrUncheckTask(model),
              value: model.finished,
            ),
            title: Text(
              model.description,
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              dateFormat.format(model.dateTime),
              style: TextStyle(
                  decoration:
                      model.finished ? TextDecoration.lineThrough : null),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(width: 1)),
          ),
        ),
      ),
    );
  }
}
