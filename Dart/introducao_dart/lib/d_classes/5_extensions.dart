void main() {
  var camiseta = Camiseta()
    ..cor = 'Branco'
    ..tamanho = 'G'
    ..marcaSet = 'ADF'
    ..modelo = 'De Gola';

  print(camiseta.tipoDeLavagem());
}

class Camiseta {
  // Caracteristicas - Atributos
  String? cor;
  String? tamanho;
  String _marca;
  String? modelo;
  // Caso nao seja passado a marca, assume o valor de nao informado, assim nunca sera nulo
  Camiseta({String? marca}) : _marca = marca ??= 'Nao informado';

  String get marcaGet => _marca;

  set marcaSet(String marcaSetParam) {
    if (marcaSetParam == 'ADF') {
      _marca = 'Academia do flutter';
    } else {
      _marca = marcaSetParam;
    }
  }
}

// O conteudo passado na extension é adicionado a classe Camisa e os atributos de camisa estao disponiveis na extension

extension CamissetaTipoLavagem on Camiseta {
  String tipoDeLavagem() {
    if (_marca == 'Academia do flutter') {
      return 'Pode lavar na maquina';
    } else {
      return 'Deve lavar a mão';
    }
  }
}
