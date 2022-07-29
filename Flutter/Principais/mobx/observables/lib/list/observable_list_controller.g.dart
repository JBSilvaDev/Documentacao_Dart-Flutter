// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observable_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObservableListController on _ObservableListControllerBase, Store {
  late final _$productsAtom =
      Atom(name: '_ObservableListControllerBase.products', context: context);

  @override
  ObservableList<dynamic> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<dynamic> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_ObservableListControllerBaseActionController =
      ActionController(name: '_ObservableListControllerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct() {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.addProduct');
    try {
      return super.addProduct();
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct() {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.removeProduct');
    try {
      return super.removeProduct();
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLongPress(String nome) {
    final _$actionInfo = _$_ObservableListControllerBaseActionController
        .startAction(name: '_ObservableListControllerBase.removeLongPress');
    try {
      return super.removeLongPress(nome);
    } finally {
      _$_ObservableListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
