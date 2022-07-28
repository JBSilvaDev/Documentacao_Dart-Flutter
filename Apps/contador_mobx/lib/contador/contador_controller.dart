// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_final_fields, unused_field
import 'package:mobx/mobx.dart';

class ContadorController {
  // 3 pilares do mobx
  // 1 observador
  // 2 ação
  // 3 reação
  var _counter = Observable<int>(0,
      name:
          'Nome deste item para identificar em caso de erros (opcional)'); // observador
  late Action
      increment; // Acao 1 é tipo late pois é implementada depois (no controlador)
  late Action
      resetIncrement; // Acao 2 é tipo late pois é implementada depois (no controlador)
  late Computed _saudacaoComputed;
  var _fullName1 =
      Observable<FullName>(FullName(nome: 'nome', sobrenome: ' sobrenome'));
  var _fullName2 =
      Observable<FullName>(FullName(nome: 'nome', sobrenome: ' sobrenome'));

  ContadorController() {
    increment = Action(_incrementCounter); //Acao 1
    resetIncrement = Action(_resetIncrement); //Acao 2
    _saudacaoComputed = Computed(() => 'Olá ${_fullName1.value.nome}');
  }

  int get counter => _counter.value;
  String get fullName1 => _fullName1.value.nome + _fullName1.value.sobrenome;
  FullName get fullName2 => _fullName2.value; // mesma coisa do acima

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    _fullName1.value = FullName(
        nome: 'Dylan',
        sobrenome:
            ' Silva'); // Metodo para alterar atributos de classe sem o copywith
    _fullName2.value = _fullName2.value.copyWith(
        nome: 'Graci',
        sobrenome:
            ' Pera'); // Metodo para alterar atributos de classe com o copywith
  }

  void _resetIncrement() {
    _counter.value = 0;
  }
}

class FullName {
  String sobrenome;
  String nome;
  FullName({
    required this.sobrenome,
    required this.nome,
  });

  FullName copyWith({
    String? sobrenome,
    String? nome,
  }) {
    return FullName(
      sobrenome: sobrenome ?? this.sobrenome,
      nome: nome ?? this.nome,
    );
  }
}
