import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'modelo_observable_controller.dart';

class ModeloObservablePage extends StatefulWidget {
  const ModeloObservablePage({Key? key}) : super(key: key);

  @override
  State<ModeloObservablePage> createState() => _ModeloObservablePageState();
}

class _ModeloObservablePageState extends State<ModeloObservablePage> {
  final controller = ModeloObservableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Modelo Observable List Page'),
        ),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  onChanged: controller.setFilter,
                    // textCapitalization: TextCapitalization.characters,
                )
                ),
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  
                  itemCount: controller.listFilter.length,
                  itemBuilder: (context, index) {
                    final productStore = controller.listFilter[index];
                    return Observer(builder: (_) {
                      return CheckboxListTile(
                        value: productStore.selected,
                        onChanged: (_) {
                          controller.selectedProduct(index);
                        },
                        title: Text(productStore.product.name),
                      );
                      ;
                    });
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
                      controller.removechecks();
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
