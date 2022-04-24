import 'dart:convert';

class Filmes {
  String id;
  String titulo;
  String descricao;
  bool mais18;
  num avaliacao;
  String estreia;
  Filmes({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.mais18,
    required this.avaliacao,
    required this.estreia,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'mais18': mais18,
      'avaliacao': avaliacao,
      'estreia': estreia
    };
  }

  factory Filmes.fromMap(Map<String, dynamic> map) {
    return Filmes(
      id: map['id'] ?? '',
      titulo: map['title'] ?? '',
      descricao: map['overview'] ?? '',
      mais18: map['adult'] ?? true,
      avaliacao: map['vote_average'] ?? 1.0,
      estreia: map['release_date'] ?? '',
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Filmes.fromJson(String json) => Filmes.fromMap(jsonDecode(json));

  @override
  String toString() {
    return '\nID: $id \nFilme:  $titulo, \nEstreia: $estreia \nAvaliação de: $avaliacao \n${mais18 ? "Verifique a classificação indicada!" : "Livre para todos os publicos"}';
  }
}
