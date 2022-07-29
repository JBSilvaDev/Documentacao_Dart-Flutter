// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_observable_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModeloObservableController on _ModeloObservableControllerBase, Store {
  Computed<List<ProductStore>>? _$listFilterComputed;

  @override
  List<ProductStore> get listFilter => (_$listFilterComputed ??=
          Computed<List<ProductStore>>(() => super.listFilter,
              name: '_ModeloObservableControllerBase.listFilter'))
      .value;

  late final _$productsAtom =
      Atom(name: '_ModeloObservableControllerBase.products', context: context);

  @override
  ObservableList<ProductStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_ModeloObservableControllerBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$_ModeloObservableControllerBaseActionController =
      ActionController(
          name: '_ModeloObservableControllerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$_ModeloObservableControllerBaseActionController
        .startAction(name: '_ModeloObservableControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_ModeloObservableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct() {
    final _$actionInfo = _$_ModeloObservableControllerBaseActionController
        .startAction(name: '_ModeloObservableControllerBase.addProduct');
    try {
      return super.addProduct();
    } finally {
      _$_ModeloObservableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removechecks() {
    final _$actionInfo = _$_ModeloObservableControllerBaseActionController
        .startAction(name: '_ModeloObservableControllerBase.removechecks');
    try {
      return super.removechecks();
    } finally {
      _$_ModeloObservableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedProduct(int index) {
    final _$actionInfo = _$_ModeloObservableControllerBaseActionController
        .startAction(name: '_ModeloObservableControllerBase.selectedProduct');
    try {
      return super.selectedProduct(index);
    } finally {
      _$_ModeloObservableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilter(String value) {
    final _$actionInfo = _$_ModeloObservableControllerBaseActionController
        .startAction(name: '_ModeloObservableControllerBase.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_ModeloObservableControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
filter: ${filter},
listFilter: ${listFilter}
    ''';
  }
}
