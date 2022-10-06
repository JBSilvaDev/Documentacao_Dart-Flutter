void main() {
  var camisetaADF = Camiseta(marca: 'Academia do flutter');
  camisetaADF.cor = 'Branca';
  camisetaADF.tamanho = 'G';
  camisetaADF.marcaSet = 'ADF';
  camisetaADF.modelo = 'Gola';

  print('A cor é ${camisetaADF.cor}');
  print('A marca é ${camisetaADF.marcaGet}');
  print('Tipo de lavagem permitida é ${camisetaADF.tipoDeLavagem()}');
}

class Camiseta {
  // Caracteristicas - Atributos
  String? cor;
  String? tamanho;
  String _marca;
  String? modelo;

  // Construtores
  Camiseta({required String marca}) : _marca = marca;

  // Modificadores
  String get marcaGet => _marca; // Get so libera acesso ao conteudo
  set marcaSet(String marcaSetParam) {
    // Set faz alteração de um conteudo, podendo haver regras de negocio para aceitar/recusar/modificar o valor passado
    if (marcaSetParam == 'ADF') {
      _marca = 'Academia do flutter';
    } else {
      _marca = marcaSetParam;
    }
  }

  // Comportamentos - Metodos
  String tipoDeLavagem() {
    if (_marca == 'Academia do flutter') {
      return 'Pode lavar na maquina';
    } else {
      return 'Deve lavar a mão';
    }
  }
}
