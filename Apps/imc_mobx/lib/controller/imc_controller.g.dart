// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImcController on ImcControllerBase, Store {
  Computed<bool>? _$riscoVidaComputed;

  @override
  bool get riscoVida =>
      (_$riscoVidaComputed ??= Computed<bool>(() => super.riscoVida,
              name: 'ImcControllerBase.riscoVida'))
          .value;

  late final _$imcAtom = Atom(name: 'ImcControllerBase.imc', context: context);

  @override
  double get imc {
    _$imcAtom.reportRead();
    return super.imc;
  }

  @override
  set imc(double value) {
    _$imcAtom.reportWrite(value, super.imc, () {
      super.imc = value;
    });
  }

  late final _$gravidadeAtom =
      Atom(name: 'ImcControllerBase.gravidade', context: context);

  @override
  String? get gravidade {
    _$gravidadeAtom.reportRead();
    return super.gravidade;
  }

  @override
  set gravidade(String? value) {
    _$gravidadeAtom.reportWrite(value, super.gravidade, () {
      super.gravidade = value;
    });
  }

  late final _$calcularImcAsyncAction =
      AsyncAction('ImcControllerBase.calcularImc', context: context);

  @override
  Future<void> calcularImc({required double peso, required double altura}) {
    return _$calcularImcAsyncAction
        .run(() => super.calcularImc(peso: peso, altura: altura));
  }

  @override
  String toString() {
    return '''
imc: ${imc},
gravidade: ${gravidade},
riscoVida: ${riscoVida}
    ''';
  }
}
