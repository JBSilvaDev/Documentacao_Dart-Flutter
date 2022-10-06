/*
Crio uma nova instancia de Objeto que so pode receber Escada
Chamo a funcao adiconar e envio a escada para ela
A funcao adicionar repassa o valor Escada para a variavel _items que pode receber o tipo generico explicado acima
Chamo o print para exibit a altura do objeto 
A Funcao altura do objeto chama a altura do item passado (no caso Escada) e absorve o retorno dela e o repassa para o print
por fim a altura da escada é exibida no console
*/
void main() {
  final construcao = Objeto<Escada>();
  construcao.adicionar(Escada());
  print(construcao.alturaObjeto());
}

class Objeto<TipoGenericoExtendido extends Item> {

  TipoGenericoExtendido? _items;

  double alturaObjeto() {
    return _items?.altura() ?? 0;
  }

  void adicionar(TipoGenericoExtendido item) {
    _items = item;
  }
}

abstract class Item {
  double altura();
}

class Escada extends Item {
  @override
  double altura() {
    return 1.5;
  }
}

class Predio extends Item {
  @override
  double altura() {
    return 10.5;
  }
}

// Com tipo generico extendido, segue o mesmo paramentro do generico comum
// Porem so ira aceitar os tipos que extendem a classe indicada, no caso Item
// A classe Pai tem acesso a todos os metodos disponiveis nos filhos
// Na invocação so é possivel tipar o objeto com os tipos que o extendem

// Explicando o codigo:
