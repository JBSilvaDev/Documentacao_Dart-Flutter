import 'package:mobx/mobx.dart';

import '../model/full_name.dart';
part 'controller_codegen.g.dart';

class ControllerCodeGen = ControllerCodegenBase with _$ControllerCodeGen;

abstract class ControllerCodegenBase with Store {

    @observable
  int counter = 0;

  @observable
  var fullName1 = FullName(sobrenome: ' sobrenome', nome: 'nome');

  @computed
  String get saudacao => 'Olá ${fullName1.nome} voce ja clicou $counter vezes';

  String get nomeCompleto1 => fullName1.nome + fullName1.sobrenome;
  
  

  @action
  void incremento() {
    counter++;
  }
  @action
  void trocaNome(){
        fullName1 = fullName1.copyWith(
        nome: 'JB',
        sobrenome:
            ' Silva');
  }
  @action
  void voltarNome(){
        fullName1 = fullName1.copyWith(
        nome: 'nome',
        sobrenome:
            ' sobrenome');
  }

}