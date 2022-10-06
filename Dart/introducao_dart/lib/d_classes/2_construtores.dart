void main() {
  var camiseta = Camiseta(marca: 'ADF');
  print(camiseta.marca);
}

class Camiseta {
  // Caracteristicas - Atributos
  String? cor;
  String? tamanho;
  String marca;
  String? modelo;

  // Construtores
  Camiseta({required this.marca});

  // Comportamentos - Metodos
  String tipoDeLavagem() {
    if (marca == 'Academia do flutter') {
      return 'Pode lavar na maquina';
    } else {
      return 'Deve lavar a mão';
    }
  }
}
