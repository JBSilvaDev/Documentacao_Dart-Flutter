# Tipos Genericos
- Usado para criar tipos que determinam o que pode ou nao ser aceito a determinado objeto.
- Exemplo 1:
    - Classe Caixa foi criada com seu tipo generico, o que possibilita que ao instacia-la possa-se informar um tipo expecifico de objetos que ela pode receber
        - A variavel segue o mesmo tipo da classe
    - Criado um metodo que adicona um item a variavel items, contudo o valor a ser atribuido deve ser o mesmo tipo passado para caixa ao instacia-la
    - Ao instanciar Caixa, a mesma foi tipada como Bola o que por sua vez ao chamar a funçao adicionar so poderia passar valores do tipo Bola.
    - Ao chamar o print obtemos o item adicionado que é uma instancia de Bola
```dart
void main() {
  final bola = Caixa<Bola>();
  bola.adicionar(Bola());
  print(bola.getItems());
}

class Caixa<TipoGenerico> {
  TipoGenerico? items;

  void adicionar(TipoGenerico item) {
    items = item;
  }

  TipoGenerico? getItems() {
    return items;
  }
}
class Bola {}
```
- Exemplo 2:
    - Classe Objeto criada com tipo generico que extente a classe Item, ou seja, so ira aceitar items que extendam a classe Item
        - A variavel segue o mesmo tipo da classe
    - Criado dois metodos, um que adiconar um item e outro que obtem a altura do item adiconado
    - Classes segundarias:
        - Item que é um requisito para ser aceito em Objeto
        - Escada que sera o objeto adiconado a classe Objeto pois a mesma extente Item. 
            - Esta classe possui um metodo que retorna sua altura
    - Ao instanciar a classe Objeto, a mesma foi tipada como Escada, o que por sua vez so aceitará objetos do tipo Escada ao chamar o metodo adiconar que popula a variavel item com o objeto passado (Escada)
    - Ao chamar o print, invoco a funcao para obeter a altura do objeto adiconado, esta funcao retorna o item passado chamando o metodo altura da classe Escada que retorna o valor e o repassa para o print exibindo no console o valor de 1.5
```dart
void main() {
  final construcao = Objeto<Escada>();
  construcao.adicionar(Escada());
  print(construcao.alturaObjeto());
}

class Objeto<TipoGenericoExtendido extends Item> {

  TipoGenericoExtendido? items;

  double alturaObjeto() {
    return items?.altura() ?? 0;
  }

  void adicionar(TipoGenericoExtendido item) {
    items = item;
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

```