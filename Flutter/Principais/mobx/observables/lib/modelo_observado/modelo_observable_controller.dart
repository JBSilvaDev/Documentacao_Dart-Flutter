import 'package:contador_mobx_codegen/models/product_model.dart';
import 'package:mobx/mobx.dart';
import 'model/product_store.dart';

part 'modelo_observable_controller.g.dart';

class ModeloObservableController = _ModeloObservableControllerBase
    with _$ModeloObservableController;

abstract class _ModeloObservableControllerBase with Store {
  @observable
  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    products.addAll([
      ProductStore(product: ProductModel(name: 'Laptop'), selected: false),
      ProductStore(product: ProductModel(name: 'Computador'), selected: false),
      ProductStore(product: ProductModel(name: 'Celular'), selected: false),
      ProductStore(product: ProductModel(name: 'Teclado'), selected: false),
      ProductStore(product: ProductModel(name: 'Mouse'), selected: false),
    ]);
  }

  @action
  void addProduct() {
    products.add(
        ProductStore(product: ProductModel(name: 'Laptop'), selected: true));
  }

  @action
  void removechecks() {
    // products.removeAt(products.length - 1);
    products.removeWhere((check) => check.selected);
  }

  @action
  void selectedProduct(int index) {
    var productSelected = products[index].selected;
    products[index].selected = !productSelected;
  }

  // Pesquisa item na lista
  @observable
  String filter = '';
  @action
  setFilter(String value) => filter = value;
  @computed
  List<ProductStore> get listFilter{
    if(filter.isEmpty){
      return products;
    }else{
      return products.where((item) => item.product.name.toUpperCase().contains(filter.toUpperCase())).toList();
    }
  }


}
