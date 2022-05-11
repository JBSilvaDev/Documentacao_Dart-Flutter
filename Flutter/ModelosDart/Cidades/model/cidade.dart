import 'dart:convert';

class Cidade {
  String? id;
  final String cidade;
  final String estado;

  Cidade({
    this.id,
    required this.cidade,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cidade': cidade,
      'estado': estado,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] ?? '',
      cidade: map['cidade'] ?? '',
      estado: map['estado'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) => Cidade.fromMap(json.decode(source));
}
