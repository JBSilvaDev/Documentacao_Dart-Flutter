import 'dart:convert';

import 'package:http/http.dart';

import '../models/filmes.dart';

class FilmesRepositories {
  Future<List<Filmes>> buscaFilmes() async {
    final filmesResponse = await get(Uri.parse('http://localhost:3031/filmes'));
    final filmesMap = jsonDecode(filmesResponse.body);

    return filmesMap.map<Filmes>((e) => Filmes.fromMap(e)).toList();
  }

  Future<Filmes> buscaID(String id) async {
    final filmesResponse =
        await get(Uri.parse('http://localhost:3031/filmes/$id'));
    final filmesMap = jsonDecode(filmesResponse.body);
    return Filmes.fromMap(filmesMap);
  }
}
