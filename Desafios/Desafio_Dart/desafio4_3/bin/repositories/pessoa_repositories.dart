import 'dart:convert';

import 'package:http/http.dart';

import '../models/localizacao/endereco.dart';
import '../models/localizacao/localizacao.dart';
import '../models/localizacao/regiao.dart';
import '../models/pessoas.dart';

class PessoaRepositories {
  Future<List<Pessoas>> findAll() async {
    final pessoas = await get(Uri.parse('http://localhost:3031/json'));
    final pessoasResponse = await jsonDecode(pessoas.body);

    return pessoasResponse
        .map<Pessoas>((pessoa) => Pessoas.fromMap(pessoa))
        .toList();
  }

  Future<void> insert(Pessoas pessoa) async {
    final pessoas = await post(Uri.parse('http://localhost:3031/json/'),
        body: pessoa.toJson(), headers: {'content-type': 'application/json'});
  }
}
