import 'dart:convert';

import 'localizacao.dart';

class Endereco {
  String rua;
  String casa;
  String cidade;
  String cep;
  Localizacao localizacao;
  Endereco({
    required this.rua,
    required this.casa,
    required this.cidade,
    required this.cep,
    required this.localizacao,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'casa': casa,
      'cidade': cidade,
      'cep': cep,
      'localizacao': localizacao.toMap()
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['street'] ?? '',
      casa: map['suite'] ?? '',
      cidade: map['city'] ?? '',
      cep: map['zipcode'] ?? '',
      localizacao: Localizacao.fromMap(map['geo'] ?? {"null":'null'}),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromJson(String json) {
    return Endereco.fromMap(jsonDecode(json));
  }

  @override
  String toString() {
    return 'Endereco(rua: $rua, casa: $casa, cidade: $cidade, cep: $cep, localizacao: $localizacao)';
  }
}
