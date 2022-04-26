import 'dart:convert';

import 'localizacao/localizacao.dart';

class Pessoas {
  String? id;
  String nome;
  int idade;
  String msg;
  String sexo;
  List<Localizacao> localizacao;
  bool filhos;
  String telefone;
  List<String> cursos;
  Pessoas({
    this.id,
    required this.nome,
    required this.idade,
    required this.msg,
    required this.sexo,
    required this.localizacao,
    required this.filhos,
    required this.telefone,
    required this.cursos,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "idade": idade,
      "msg": msg,
      "sexo": sexo,
      "localizacao": localizacao.map((e) => e.toMap()).toList(),
      "filhos": filhos,
      "telefone": telefone,
      "cursos": cursos
    };
  }

  factory Pessoas.fromMap(Map<String, dynamic> map) {
    return Pessoas(
        id: map['id'],
        nome: map['nome'],
        idade: map['idade'],
        msg: map['msg'],
        sexo: map['sexo'],
        localizacao: map['localizacao']
            .map<Localizacao>((localizacaoMap) => Localizacao.fromMap(localizacaoMap)).toList(),
        filhos: map['filhos'],
        telefone: map['telefone'],
        cursos: map['cursos'].cast<String>());
  }

  String toJson() => jsonEncode(toMap());
  factory Pessoas.fromJson(String json) {
    return Pessoas.fromMap(jsonDecode(json));
  }

  @override
  String toString() {
    return 'Pessoa(id: $id, nome: $nome, idade: $idade, msg: $msg, sexo: $sexo, localizacao: $localizacao, filhos: $filhos, telefone: $telefone, cursos: $cursos)';
  }
}
