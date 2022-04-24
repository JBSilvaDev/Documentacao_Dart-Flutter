import 'dart:convert';

import 'endereco.dart';

class Users {
  String? id;
  String nome;
  String login;
  String email;
  Endereco endereco;
  String site;
  Users({
    this.id,
    required this.nome,
    required this.login,
    required this.email,
    required this.endereco,
    required this.site,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'login': login,
      'email': email,
      'endereco': endereco.toMap(),
      'site': site
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
        id: map['id'] ?? '',
        nome: map['name'] ?? '',
        login: map['username'] ?? '',
        email: map['email'] ?? '',
        endereco: Endereco.fromMap(map['address'] ?? {"null": 'null'}),
        site: map['website'] ?? '');
  }

  String toJson() => jsonEncode(toMap());

  factory Users.fromJson(String json) => Users.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Users(id: $id, nome: $nome, login: $login, email: $email, endereco: $endereco, site: $site)';
  }
}
