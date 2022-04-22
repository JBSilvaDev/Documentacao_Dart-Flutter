```dart
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/aluno.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/cidade.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/curso.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/endereco.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/models/telefone.dart';
import 'package:dart_consumo_de_api/subindo_backend_dartion/repositories/alunos_repositories.dart';

class AlunosController {
  final _alunosRepositories = AlunosRepositories();

  Future<void> findAll() async {
    final alunos = await _alunosRepositories.findAll();

    alunos.forEach(print);

    //alunos.forEach((aluno) => print(aluno));
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepositories.finById(id);

    print(aluno);
  }

  Future<void> update(String id) async {
    final aluno = await _alunosRepositories.finById(id);

    aluno.nomeCursos.add('Imersao a Json');
    await _alunosRepositories.update(aluno);

    final alunoAlterado = await _alunosRepositories.finById(id);
    print('Lista de cursos para ${alunoAlterado.nome} foi atualizada para: ');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Graciele',
      nomeCursos: ['Fundamental', 'Médio', 'Vendas Online'],
      endereco: Endereco(
          rua: 'Rua de barro',
          numero: 50,
          cep: '45785-000',
          cidade: Cidade(id: 1, nome: 'Vitorioa'),
          telefone: Telefone(ddd: 73, telefone: '789448754')),
      cursos: [
        Curso(id: 1, nome: 'Médio', isAluno: false),
        Curso(id: 2, nome: 'Vendas Online', isAluno: true)
      ],
    );

    _alunosRepositories.insert(aluno);

    print('Novo aluno ${aluno.nome} adicionado a lista');
  }
}
```