void main() {
  // o ';' vem apenas no final da notação nao em cada linha como normalmente é
  var camiseta = Camiseta()
    ..cor = 'Branco'
    ..tamanho = 'G'
    ..marca = 'ADF'
    ..modelo = 'De Gola';
}

class Camiseta {
  // Caracteristicas - Atributos
  String? cor;
  String? tamanho;
  String? marca;
  String? modelo;

  // Comportamentos - Metodos
  String tipoDeLavagem() {
    if (marca == 'Academia do flutter') {
      return 'Pode lavar na maquina';
    } else {
      return 'Deve lavar a mão';
    }
  }
}
