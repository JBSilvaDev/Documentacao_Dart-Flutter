void main() {
  final pessoas = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Feminino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  print('=' * 50);
  print('Remova os pacientes duplicados e apresente a nova lista');
  //! Tranformando em set remove as duplicidades pois set nao aceita valores repetidos
  final newPessoa = pessoas.toSet().toList();
  //! Resolução nova lista sem duplicidade
  print(newPessoa);

  print('=' * 50);
  print(
      'Me mostre a quantidade de pessoas por sexo (Masculino e Feminino) e depois me apresente o nome dela');
  //! Lista que ira receber pessoas do sexo masculino
  List sexoM = [];
  //! Lista que ira receber pessoas do sexo Feminino
  List sexoF = [];
  // Percorre toda lista nova (sem duplicidade)
  for (var p in newPessoa) {
    // Cria nova lista com nomes separando os itens por |
    var listaNova = p.split('|');
    // Obtem o sexo de cada passoa na lista e converte o recebido em minusculo
    var sexo = listaNova[2].toLowerCase();
    // Obtem o nome de cada pessoa na lista
    var nome = listaNova[0];
    if (sexo == "masculino") {
      // Adiciona a lista sexoM pessoas do sexo masculino
      sexoM.add(nome);
    } else {
      // Adiciona a lista sexoF pessoas do sexo feminino
      sexoF.add(nome);
    }
  }
  //! Resolução exibe a quantidade de pessoas por sexo e depois exibe o nome delas
  print('''
Há ${sexoM.length} pessoas do sexo masculino.
Há ${sexoF.length} pessoas do sexo feminino.
''');

  print('Nomes pessoas sexo F');
  sexoF.forEach((nome) => print(nome));
  print('');
  print('Nomes pessoas sexo M');
  sexoM.forEach((nome) => print(nome));

  print('=' * 50);
  print(
      'Filtrar e deixar a lista somente com pessoas maiores de 18 anos e apresente essas pessoas pelo nome');

  var pessoasMaiores18 = [];
  for (var lista in newPessoa) {
    var novaLista = lista.split('|');
    String nome = novaLista[0];
    int idade = int.tryParse(novaLista[1]) ?? 0;
    if (idade > 18) {
      pessoasMaiores18.add(nome);
    }
  }
  print('Nova lista com pessoas maiores de 18 anos');
  print(pessoasMaiores18);
  print('Nomes das pessoas maiores de 18 anos');
  pessoasMaiores18.forEach((element) => print(element));

  print('=' * 50);
  print('Encontre a pessoa mais velha e apresente o nome dela.');

  var maisVelha = newPessoa.map((e) => e.split('|')).toList();

  maisVelha.sort((a, b) {
    int idade_1 = int.tryParse(a[1]) ?? 0;
    int idade_2 = int.tryParse(b[1]) ?? 0;

    return idade_2.compareTo(idade_1);
  });

  var pessoaMaisVelha = maisVelha.first;
  print(
      'A pessoa mais velha é ${pessoaMaisVelha[0]} com ${pessoaMaisVelha[1]} anos');
}
