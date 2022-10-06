void main() {
  List<int> numeros = [1, 2, 3];
  numeros.add(4);

  final bola = Caixa<Bola>();
  bola.adicionar(Bola());
  print(bola.getItems());

  final boneca = Caixa<Boneca>();
  boneca.adicionar(Boneca());
  boneca.getItems();
}

class Caixa<TipoGenerico> {
  TipoGenerico? _items;

  void adicionar(TipoGenerico item) {
    _items = item;
  }

  TipoGenerico? getItems() {
    return _items;
  }
}

class Bola {}

class Boneca {}

// é possivel criar um tipo que recebe outros tipos
// Bola e Boneca sao tipos diferentes, logo nao pode ter os dois tipos numa lista
// Para a lista aceitar os dois tipos cria-se um tipo generico que recebe os dois tipos
// Entao tipa a lista com esse tipo generico criado
// Quando coloca um tipo generico numa classe, ao ser instanciada ela ira aderir ao tipo passado a ela
// No exemplo se faz 2 instancias da classe caixa, porem cada uma de um tipo diferente


