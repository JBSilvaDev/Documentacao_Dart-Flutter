```dart
import 'dart:convert';

import 'package:dart_consumo_de_api/subindo_backend_dartion/models/curso.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/endereco.dart';

class Aluno {
  String? id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  Endereco endereco;
  List<Curso> cursos;
  Aluno({
    this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.endereco,
    required this.cursos,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'idade': idade ?? 0,
        'nomeCursos': nomeCursos,
        'endereco': endereco.toMap(),
        // Este campo retorna uma lista de mapas, entao faz-se o mapeio salvando mapa a mapa no seu conteudo
        'cursos': cursos.map((curso) => curso.toMap()).toList()
      };

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
        id: map['id'] ?? '0',
        nome: map['nome'] ?? '',
        idade: map['idade'], // Campo opcional nao precisa o ?? ''
        nomeCursos: map['nomeCursos'].cast<String>() ?? [], // Outro metoro para converter a lista para tipo String -> List<String>.from(map['nomeCursos'] ?? [])
        endereco: Endereco.fromMap(map['endereco'] ?? {}),
        // Este campo retorna uma lista de mapas, entao convertemos cada mapa da lista usando a classe Cursos, salvando o retorno numa nova lista
        cursos: map['cursos'].map<Curso>((cursoMap) => Curso.fromMap(cursoMap)).toList());
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, idade: $idade, nomeCursos: $nomeCursos, endereco: $endereco, cursos: $cursos)';
  }
}
```