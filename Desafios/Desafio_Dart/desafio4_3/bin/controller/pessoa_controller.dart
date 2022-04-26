import '../models/localizacao/endereco.dart';
import '../models/localizacao/localizacao.dart';
import '../models/localizacao/regiao.dart';
import '../models/pessoas.dart';
import '../repositories/pessoa_repositories.dart';

class PessoaController {
  final _pessoaController = PessoaRepositories();
  Future<void> findAll() async {
    final pessoas = await _pessoaController.findAll();
    pessoas.forEach((element) => print(element));
  }

  Future<void> insert() async {
    final pessoa = Pessoas(
        nome: 'Damaz',
        idade: 28,
        msg: "Salve cumpadi",
        sexo: "M",
        localizacao: [
          Localizacao(
              regiao: Regiao(pais: 'Brasil', estado: "BA", cidade: "Itabata"),
              endereco: Endereco(
                  rua: 'Rua da fossa',
                  numero: 37,
                  bairro: "TL",
                  resAtual: true))
        ],
        filhos: true,
        telefone: '789546548',
        cursos: ['nao tem']);

    await _pessoaController.insert(pessoa);

    print(
        'Nova pessoa ${pessoa.nome}, adicionada ao Json, com ID: ${pessoa.id}');
  }
}
