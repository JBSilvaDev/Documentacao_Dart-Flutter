import 'dart:convert';

class Endereco {
  String rua;
  int numero;
  String bairro;
  bool resAtual;
  Endereco({
    required this.rua,
    required this.numero,
    required this.bairro,
    required this.resAtual,
  });

  Map<String, dynamic> toMap() {
    return {
      "rua": rua,
      "numero": numero,
      "bairro": bairro,
      "resAtual": resAtual
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
        rua: map['rua'] ?? '',
        numero: map['numero'] ?? 0,
        bairro: map['bairro'] ?? '',
        resAtual: map['resAtual'] ?? false);
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, bairro: $bairro, resAtual: $resAtual)';
  }
}
