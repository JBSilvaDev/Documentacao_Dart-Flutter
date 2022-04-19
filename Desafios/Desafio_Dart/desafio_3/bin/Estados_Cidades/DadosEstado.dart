import 'package:http/http.dart';
import 'dart:convert';
import '../ConexaoBD_MySQL/DadosMySql.dart';

Future<void> estados() async {
  var urlIBGE = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
  var toURI = Uri.parse(urlIBGE);
  var response = await get(toURI);

  var responseConvertData = jsonDecode(response.body);

  // Abrinco conexao SQL
  for (var e in responseConvertData) {
    final ativarSQL = MySQLBD();
    var conexaoSQL = await ativarSQL.openConnection();
    await Future.delayed(Duration(seconds: 1));
    int id = e["id"];
    String sigla = e["sigla"];
    String nome = e["nome"];
    await conexaoSQL.query(
        'insert into estado(id, uf, nome) values(?, ?, ?)', [id, sigla, nome]);
    await conexaoSQL.close();
  }
}
