void main() {
  Caixa c = CaixaImpl();
  c.add(Bola());
  c.add(Boneca());
  CaixaBoneca c2 = CaixaBoneca();
  c2.add(Boneca());
}

abstract class Caixa<P extends Produto> {
  void add(P produto);
}

class Produto {}

class CaixaImpl<P extends Produto> implements Caixa<P> {
  List<P> produtos = [];

  @override
  void add(P produto) {
    produtos.add(produto);
  }
}


class Bola extends Produto {}

class Boneca extends Produto {}

class CaixaBoneca extends Caixa<Boneca> {
  @override
  void add(Boneca produto) {}
}
