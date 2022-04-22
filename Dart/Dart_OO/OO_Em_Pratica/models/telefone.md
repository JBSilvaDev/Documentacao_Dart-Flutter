```dart
import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  // toMap() é um metodo pega o objeto e transforma em um map de <String. dynamic>
  Map<String, dynamic> toMap() {
    return {'ddd': ddd, 'telefone': telefone};
  }

  // fromMap() é um contrutor, onde transforma um Map e transforma em um objeto
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  // toJson() é um metodo que retorna uma string do objeto (converte o objeto em string)
  String toJson() => jsonEncode(toMap());

  // fromJson é um contrutor que baseado no json, retorna um objeto
  /* 
  factory Telefone.fromJson(String json){
    Map<String, dynamic> jsonMap = jsonDecode(json);
    final telefone = Telefone.fromMap(jsonMap);
    return telefone
  }
  */
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));


  @override
  String toString() => '($ddd) $telefone';
}
```