import '../models/endereco.dart';
import '../models/localizacao.dart';
import '../models/users.dart';
import '../repositories/users_repositories.dart';

class UsersController {
  final _usersRepositores = UsersRepositories();
  Future<void> buscaUsers() async {
    final usuario = await _usersRepositores.buscaUsers();

    print(usuario);
  }

  Future<void> buscaId(String id) async {
    final usuario = await _usersRepositores.buscaId(id);

    print(usuario);
  }

  Future<void> novoUser() async {
    final usuario = Users(
        nome: 'JB',
        login: 'Jbsilva',
        email: 'jb@gmail.com',
        endereco: Endereco(
            rua: 'Das Olivas',
            casa: '50',
            cidade: 'Mucuri',
            cep: '00004455-00',
            localizacao:
                Localizacao(latitude: 'latitude', longitude: 'longitude')),
        site: 'jbtec.com.br');
    _usersRepositores.novoUsuario(usuario);

    print('${usuario.nome} adicionado');
  }
}
