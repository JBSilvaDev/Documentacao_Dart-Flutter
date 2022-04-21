class Cursos {
  String nome;
  String descricao;
  Cursos({
    required this.nome,
    required this.descricao,
  });

  @override
  String toString() => 'Cursos(nome: $nome, descricao: $descricao)';
}
