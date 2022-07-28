// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_codegen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerCodeGen on ControllerCodegenBase, Store {
  Computed<String>? _$saudacaoComputed;

  @override
  String get saudacao =>
      (_$saudacaoComputed ??= Computed<String>(() => super.saudacao,
              name: 'ControllerCodegenBase.saudacao'))
          .value;

  late final _$counterAtom =
      Atom(name: 'ControllerCodegenBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$fullName1Atom =
      Atom(name: 'ControllerCodegenBase.fullName1', context: context);

  @override
  FullName get fullName1 {
    _$fullName1Atom.reportRead();
    return super.fullName1;
  }

  @override
  set fullName1(FullName value) {
    _$fullName1Atom.reportWrite(value, super.fullName1, () {
      super.fullName1 = value;
    });
  }

  late final _$ControllerCodegenBaseActionController =
      ActionController(name: 'ControllerCodegenBase', context: context);

  @override
  void incremento() {
    final _$actionInfo = _$ControllerCodegenBaseActionController.startAction(
        name: 'ControllerCodegenBase.incremento');
    try {
      return super.incremento();
    } finally {
      _$ControllerCodegenBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaNome() {
    final _$actionInfo = _$ControllerCodegenBaseActionController.startAction(
        name: 'ControllerCodegenBase.trocaNome');
    try {
      return super.trocaNome();
    } finally {
      _$ControllerCodegenBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void voltarNome() {
    final _$actionInfo = _$ControllerCodegenBaseActionController.startAction(
        name: 'ControllerCodegenBase.voltarNome');
    try {
      return super.voltarNome();
    } finally {
      _$ControllerCodegenBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
fullName1: ${fullName1},
saudacao: ${saudacao}
    ''';
  }
}
