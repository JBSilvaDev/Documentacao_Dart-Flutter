```dart

import 'dart:convert';

import 'package:http/http.dart';

import '../models/aluno.dart';

class AlunosRepositories {
  Future<List<Aluno>> findAll() async {
    final alunosResponse = await get(Uri.parse('http://localhost:3031/alunos'));

    final alunosList = jsonDecode(alunosResponse.body);

    final aluno =
        alunosList.map<Aluno>((alunoMap) => Aluno.fromMap(alunoMap)).toList();

    return aluno;
  }

  Future<Aluno> finById(String id) async {
    final alunosResponse =
        await get(Uri.parse('http://localhost:3031/alunos/$id'));

    final alunoMap = jsonDecode(alunosResponse.body);

    return Aluno.fromMap(alunoMap);
    // Para este caso como o retorno ja é um Objeto entre aspas, ou seja é um objeto string, pode-se passar diretamente para o fromJson no retorno
    // return Aluno.fromJson(alunosResponse.body)
  }

  Future<void> update(Aluno aluno) async {
    await put(Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
        body: aluno.toJson(), headers: {'content-type': 'application/json'});
  }

  Future<void> insert(Aluno aluno) async {
    await post(Uri.parse('http://localhost:3031/alunos/'),
        body: aluno.toJson(), headers: {'content-type': 'application/json'});
  }
}
```