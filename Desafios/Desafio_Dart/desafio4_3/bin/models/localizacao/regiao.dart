import 'dart:convert';

class Regiao {
  String pais;
  String estado;
  String cidade;
  Regiao({
    required this.pais,
    required this.estado,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {  
    return{
    "pais": pais,
    "estado": estado,
    "cidadee": cidade
    };
  }

  factory Regiao.fromMap(Map<String, dynamic> map) {
    return Regiao(
      pais: map['pais'] ?? '',
      estado: map['estado'] ?? '',
      cidade: map['cidade'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Regiao.fromJson(String json) => Regiao.fromMap(jsonDecode(json));

  @override
  String toString() => 'Regiao(pais: $pais, estado: $estado, cidade: $cidade)';
}
