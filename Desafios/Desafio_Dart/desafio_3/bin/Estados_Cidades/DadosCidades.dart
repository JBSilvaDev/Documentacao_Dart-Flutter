import 'dart:convert';
import 'package:http/http.dart';
import '../ConexaoBD_MySQL/DadosMySql.dart';

Future<void> cidades() async {
  final ativarSQL = MySQLBD();
  var conexaoSQL = await ativarSQL.openConnection();
  await Future.delayed(Duration(seconds: 1));

  var consBD = await conexaoSQL.query('select id from dart_mysql.estado');

  var iDestados = [];
  for (var i in consBD) {
    iDestados.add(i["id"]);
  }
  conexaoSQL.close();

  for (var id in iDestados) {
    var urlIBGE =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/distritos';
    var toURI = Uri.parse(urlIBGE);
    var response = await get(toURI);

    var responseConvertData = jsonDecode(response.body);

    //Abrindo conexao SQL
    for (var cidade in responseConvertData) {
      final activesql = MySQLBD();
      var newconexaoSQL = await activesql.openConnection();
      await Future.delayed(Duration(seconds: 1));
      int idCity = int.parse(cidade["id"]);
      String nome = cidade["nome"];
      await newconexaoSQL.query(
          'insert into cidade(id, id_uf, nome) values(?, ?, ?)',
          [idCity, id, nome]);
      await conexaoSQL.close();
    }
  }
}

// forEach nao aceita await (processos ascincronos), usar for in
