import 'dart:convert';
import 'package:http/http.dart';
import '../ConexaoBD_MySQL/DadosMySql.dart';

Future<void> cidades() async {
  // Conecta ao BD SQL para buscar IDs dos estados
  final ativarSQL = MySQLBD();
  var conexaoSQL = await ativarSQL.openConnection();
  await Future.delayed(Duration(seconds: 1));
  // Seleciona toda tabela estado
  var consBD = await conexaoSQL.query('select * from dart_mysql.estado');

  var idEstados = [];
  // Salva em lista todos os IDs dos estados
  for (var i in consBD) {
    idEstados.add(i["id"]);
  }
  conexaoSQL.close(); // fecha conexão

  // Para cada id de estado na lista, acesse a API que corresponde ao estado do id passado
  for (var id in idEstados) {
    var urlIBGE =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/distritos';
    var toURI = Uri.parse(urlIBGE);
    var response = await get(toURI);

    var responseConvertData = jsonDecode(response.body);

    // Abrindo conexao SQL para cada cidade no estado recebido pela API
    for (var cidade in responseConvertData) {
      final activesql = MySQLBD();
      var newconexaoSQL = await activesql.openConnection();
      await Future.delayed(Duration(seconds: 1));
      // Converte em inteiro e salva em variavel o valor do Id da cidade
      int idCity = int.parse(cidade["id"]);
      // Salva em variavel o valor do nome da cidade
      String nome = cidade["nome"];
      // Insere os dados no MySQL
      await newconexaoSQL.query(
          'insert into cidade(id, id_uf, cidade) values(?, ?, ?)',
          [idCity, id, nome]);
      await conexaoSQL.close();
    }
  }
}

// OBS: forEach nao aceita await (processos ascincronos), usar for in
