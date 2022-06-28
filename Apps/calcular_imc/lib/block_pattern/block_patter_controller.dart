// ignore_for_file: unused_field

import 'dart:async';
import 'dart:math';

import 'package:calcular_imc/block_pattern/imc_state.dart';

class BlockPatterController {
  final _imcStreamController = StreamController<ImcState>.broadcast()
    ..add(ImcState(imc: 0));

  Stream<ImcState> get imcOut => _imcStreamController.stream;

  Future<void> calcularIMC(
      {required double peso, required double altura}) async {
    _imcStreamController.add(IMCStateLoading());
    await Future.delayed(const Duration(milliseconds: 800));
    final imc = peso / pow(altura, 2);
    _imcStreamController.add(ImcState(imc: imc));
  }

  void dispose() {
    _imcStreamController.close();
  }
}
