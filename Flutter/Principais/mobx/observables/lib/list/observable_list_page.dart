import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'observable_list_controller.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({Key? key}) : super(key: key);

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final controller = ObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Observable List Page'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final nomeProduto = controller.products[index].name;
                    return ListTile(
                      title: Text(nomeProduto),
                      trailing: IconButton(icon:Icon(Icons.delete, color: Colors.red),onPressed: () => controller.removeLongPress(nomeProduto),),
                    );
                  },
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.addProduct();
                    },
                    child: Text('Adicionar')),
                ElevatedButton(
                    onPressed: () {
                      controller.removeProduct();
                    },
                    child: Text('Remover')),
                ElevatedButton(
                    onPressed: () {
                      controller.loadProducts();
                    },
                    child: Text('Carregar')),
              ],
            )
          ],
        ));
  }
}
