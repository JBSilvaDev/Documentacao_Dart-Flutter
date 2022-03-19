main() {
  final pacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|desenvolvedor|MG',
    'Sandra Silva|40|Desenvolvedor|MG',
    'Regina Verne|35|dentista|MG',
    'João Rahman|55|jornalista|SP',
  ];

  print('=' * 50);
  print('Apresente os pacientes com mais de 20 anos e print o nome deles');

  //! Percorre toda lista pacientes
  for (var paciente in pacientes) {
    // Transforma cada item da lista pacientes em uma nova lista separada por |
    List listaNovaPacientes = paciente.split('|');
    // Obtem os nomes na nova lista
    String nome = listaNovaPacientes[0];
    // Obtem as idades na nova lista, tenta transformar em intenro, caso falhe transforme em 0
    int idade = int.tryParse(listaNovaPacientes[1]) ?? 0;
    //! Resolução final apresentando pacientes com mais de 20 anos
    if (idade > 20) {
      print('$nome tem $idade anos');
    }
  }
  print('=' * 50);
  print(
      'Apresente quantos pacientes existem para cada profissão (desenvolvedor, estudante, dentista, jornalista)');
  //! Definindo variaveis para receber a quantidade de pacientes em cada profissão, tambem poderiam ser listas com seus nomes, idades etc... nesse caso poderia usar outro for para percorrer cada listanova
  int dev = 0;
  int est = 0;
  int dent = 0;
  int jorn = 0;
  //! Percorre toda lista pacientes
  for (var paciente in pacientes) {
    // Transforma cada item da lista pacientes em uma nova lista separada por |
    List novaLista = paciente.split('|');
    // Obtem as profissoes na nova lista
    String profissao = novaLista[2];
    // Adiciona +1 caso o item na nova lista seja igual a cada caso (antes os transofrma em minusculos)
    switch (profissao.toLowerCase()) {
      case "desenvolvedor":
        dev++;
        break;
      case "estudante":
        est++;
        break;
      case "dentista":
        dent++;
        break;
      case "jornalista":
        jorn++;
        break;
      default:
        break;
    }
  }
  //! Resolução final exibindo a quantidade de pacientes para cada profissão
  print('''
Dentistas: $dent
Desenvolvedores: $dev
Jornalistas: $jorn
Estudantes: $est
''');
  print('=' * 50);
  print('Apresente a quantidade de pacientes que moram em SP');
  //!
  List moradoresSP = [];
  for (var paciente in pacientes) {
    var novaLista = paciente.split('|');
    String cidade = novaLista[3];
    if (cidade == 'SP') {
      moradoresSP.add(novaLista[0]);
    }
  }
  moradoresSP.forEach((nome) => print(nome));
  print('Em SP moram ${moradoresSP.length} pessoas');
}
