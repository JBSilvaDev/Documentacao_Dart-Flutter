class FullName {
  String sobrenome;
  String nome;
  FullName({
    required this.sobrenome,
    required this.nome,
  });

  FullName copyWith({
    String? sobrenome,
    String? nome,
  }) {
    return FullName(
      sobrenome: sobrenome ?? this.sobrenome,
      nome: nome ?? this.nome,
    );
  }
}
