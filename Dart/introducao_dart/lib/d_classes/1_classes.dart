void main() {
  var camisetaADF = Camiseta();
  camisetaADF.cor = 'Branca';
  camisetaADF.tamanho = 'G';
  camisetaADF.marca = 'Academia do flutter';
  camisetaADF.modelo = 'Gola';

  print('A cor é ${camisetaADF.cor}');
  print('A marca é ${camisetaADF.marca}');
  print('Tipo de lavagem permitida é ${camisetaADF.tipoDeLavagem()}');
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
