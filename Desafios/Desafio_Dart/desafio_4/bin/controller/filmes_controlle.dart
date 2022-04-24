import '../repositories/filmes_repositories.dart';

class FilmesControlle {
  final _filmesController = FilmesRepositories();

  Future<void> buscaFilmes() async {
    final filmes = await _filmesController.buscaFilmes();

    for (var filme in filmes) {
      print(filme);
    }
  }

  Future<void> buscaID(String id) async {
    final filme = await _filmesController.buscaID(id);
    print(filme);
  }
}
