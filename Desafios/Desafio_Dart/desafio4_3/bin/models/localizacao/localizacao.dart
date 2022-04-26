import 'dart:convert';

import 'endereco.dart';
import 'regiao.dart';

class Localizacao {
  Regiao regiao;
  Endereco endereco;
  Localizacao({
    required this.regiao,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {"regiao": regiao.toMap(), "endereco": endereco.toMap()};
  }

  factory Localizacao.fromMap(Map<String, dynamic> map) {
    return Localizacao(
        regiao: Regiao.fromMap(map['regiao'] ?? {}),
        endereco: Endereco.fromMap(map['endereco'] ?? {}));
  }
  String toJson() => jsonEncode(toMap());

  factory Localizacao.fromJson(String json) {
    return Localizacao.fromMap(jsonDecode(json));
  }

  @override
  String toString() => 'Localizacao(regiao: $regiao, endereco: $endereco)';
}
