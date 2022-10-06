void main() {
  // Verificar heranças e polimorfismo
  // Somente atributos da classe abs ficam disponiveis, exemplo tamanho e cor
  Camiseta camiseta = CamisetaLavagem(); // os atributos de CamisaLavegem so estariam disponiveis caso seu tipo fosse var e nao Camiseta
  print(camiseta.tipoLavagem());
  print(camiseta.tamanho); // sem erros
  print(camiseta.cor); // erro de atributo nao definico em Camiseta
}

abstract class Camiseta {
  String? tamanho;
  String tipoLavagem();
}

class CamisetaLavagem implements Camiseta {
  String cor = 'Branco';
  @override
  String? tamanho = 'P';
  @override
  String tipoLavagem() {
    return 'Pode lavar normalmente';
  }
}
