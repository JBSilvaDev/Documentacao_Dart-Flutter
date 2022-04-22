```dart
import 'dart:convert';

class Cidade {
  int id;
  String nome;
  Cidade({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() => {'id': id, 'nome': nome};

  factory Cidade.fromMap(Map<String, dynamic> map) =>
      Cidade(id: map['id'], nome: map['nome']);

  String toJson() => jsonEncode(toMap());

  factory Cidade.fromJson(String json) => jsonDecode(json);
  

  @override
  String toString() => 'Cidade(id: $id, nome: $nome)';
}
```