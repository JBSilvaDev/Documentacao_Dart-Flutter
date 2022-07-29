import 'dart:math';

import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = ImcControllerBase with _$ImcController;

abstract class ImcControllerBase with Store {
  @observable
  double imc = 0.0;

  @observable
  String? gravidade;

  @computed
  bool get riscoVida => gravidade != null;

  @action
  Future<void> calcularImc({
    required double peso,
    required double altura,
  }) async {
    imc = 0;
    gravidade = null;
    await Future.delayed(const Duration(seconds: 1));
    imc = peso / pow(altura, 2);
    if (imc > 35) {
      gravidade = 'Talvez seja necessário procurar um médico';
    }
  }
}
