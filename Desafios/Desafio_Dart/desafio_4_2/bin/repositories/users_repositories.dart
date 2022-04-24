import 'dart:convert';

import 'package:http/http.dart';

import '../models/users.dart';

class UsersRepositories {
  Future<List<Users>> buscaUsers() async {
    final usuarios = await get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final usersResponse = jsonDecode(usuarios.body);
    return usersResponse.map<Users>((e)=> Users.fromMap(e)).toList();
  }

    Future<Users> buscaId(String id) async {
    final usuarios = await get(Uri.parse('http://localhost:3031/users/$id'));
    final usersResponse = jsonDecode(usuarios.body);
    return Users.fromMap(usersResponse);
  }

    Future<void> novoUsuario(Users usuario) async {
    await post(Uri.parse('http://localhost:3031/users/'), body: usuario.toJson(), headers: {'content-type': 'application/json'});

  }
}
