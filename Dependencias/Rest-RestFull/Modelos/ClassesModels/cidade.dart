import 'dart:convert';

class Cidade {
  final String cep;
  final String logradouro;
  final String complemento;
  final String localidade;
  final String bairro;
  final String uf;
  final String ddd;

  Cidade({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.localidade,
    required this.bairro,
    required this.uf,
    required this.ddd,
  });

//.fromMap é apenas um subnome pois o contrutor Cidade ja existe e nao pode haver 2 com mesmo nome
  factory Cidade.fromMap(Map<String, dynamic> map) { // Recebe um mapa como parametro (esse parametro vem da funcao Cidade.fromJson)
    return Cidade( // Retorna conteudo recebido
        cep: map['cep'] ?? '',
        logradouro: map['logradouro'] ?? '',
        complemento: map['complemento'] ?? '',
        bairro: map['bairro'] ?? '',
        localidade: map['localidade'] ?? '',
        uf: map['uf'] ?? '',
        ddd: map['ddd'] ?? '');
  }
// .fromJSON é apenas um subnome pois o contrutor Cidade ja existe e nao pode haver 2 com mesmo nome
 factory Cidade.fromJSON(String source) { // Recebe uma String como parametro (valor enviado da api)
   var jsonMap = jsonDecode(source); // Converte a String recebida da API em um mapa
   return Cidade.fromMap(jsonMap); // Envia o mapa convertido para a funcao Cidade.fromMap
}

/* ou
factory Cidade.fromJson(String source) => Cidade.fromMap(jsonDecode(source));
*/
  
// Tranforma o conteudo da Cidade em um mapa
  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  // Transforma o toMap em um json
  String toJson() => jsonEncode(toMap());


  // Metodo automatico do vsCode, apenas para retornar o conteudo da classe como uma string
  @override
  String toString() {
    return 'Cidade(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro $bairro, localidade: $localidade, uf: $uf, ddd: $ddd)';
  }
}


/* Fazer
{
  cep: 45936-000,
  logradouro: ,
  complemento: ,
  bairro: Itabatan,
  localidade: Mucuri,
  uf: BA,
  ibge: 2922003,
  gia: ,
  ddd: 73,
  siafi: 3741
}
*/