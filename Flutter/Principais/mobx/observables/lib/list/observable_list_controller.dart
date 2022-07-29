
import 'package:mobx/mobx.dart';

import '../models/product_model.dart';

part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase
    with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  @observable
 ObservableList products = ObservableList(); // Usado para observar alterações no conteudo de uma lista, outro metodo de usar é (var products = <Tipo>[].asObservable())


  @action
  void loadProducts() {
    products.addAll([
      ProductModel(name: 'Laptop'),
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
    ]);
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: 'LapTop'));
  }

  @action
  void removeProduct() {
    if(products.length >=1){
      products.removeAt(products.length - 1);
    }
  }
}
