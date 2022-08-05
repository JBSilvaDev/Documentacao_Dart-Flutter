# Heranças de classes

## Extends

- Uma classe pode estender outra usando o extends
    - Essa nova classe vai herdar os atribubos, caracteriscas, etc... do que esta sendo extendido
    - Quando estendemos uma classe os metodos e atributos da classe *Pai* passam para o filho, abaixo exemplo a classe ```Sobrenome``` herdou a variavel nome de seu pai
    - ```dart
        class Nome {
            String? nome;
        }
        ```
    - ```dart
        class Sobrenome extends Nome{
        
        }
        ```
    - Assim é possivel chamar a variavel nome na classe ```Sobrenome```
    - ```dart
        var n = Sobrenome();
        n.nome = 'JB';
        ```
- Quando temos um metódo nao implementado na classe pai obrigatoriamente ela se torna uma classe abstract, e seus hedeiros sao obrigados a implementar este metodo *(estes metodos podem conter parametros que tambem serão obrigatorios para os filhos)*
- **OBS Variaveis tambem podem ser abstratas, os que as tornam obrigatorias para os filhos assim como a classe**
  - Sem paramentros
    - ```dart
        abstract class Nome {
        String? nome 
        String qualNome();
        }
        ```
    - ```dart
        class Sobrenome extends Nome{     
        @override
        String qualNome (){
            return 'Seu nome é $nome';
            }
        }
        ```
    - Assim para obter o retorno da implementação feita na classe filha basta chamar o metodo da mesma
    - ```dart
        void main() {
        var n = Sobrenome();
        n.nome = 'JB';
        print(n.qualNome());
        }
      ```
    - ```O retorno é -> *Seu nome é JB*```
  - Com parametros
    - ```dart
        abstract class Nome {
        String qualNome(String nome);
        }
        ```
    - ```dart
        class Sobrenome extends Nome{     
        @override
        String qualNome(String nome) {
          return 'Seu nome é $nome';
        }
        ```
    - Assim para obter o retorno da implementação feita na classe filha basta chamar o metodo da mesma
    - ```dart
        void main() {
        var n = Sobrenome().qualNome('JB');
        print(n);
        }
        ```
    - ```O retorno é -> *Seu nome é JB* ```
- É possivel uma classe chamar um metodo da classe que ela estende, abaixo vemos que o estagiario apos executar sua atividade chama o anestesista atrasvez do *super*
```dart
  void main() {
    EstagiarioAnastesista().operar();
  }

  abstract class Medico {
    void operar();
  }

  class Anestesista extends Medico {
    @override
    void operar() {
      print('Anestesiar pacientes');
    }
  }

  class EstagiarioAnastesista extends Anestesista {
    @override
    void operar() {
      print('Preparar e esterelizar os equipamentos');
      super.operar();
    }
  }
  ```
- Quando um pai possui um atributo obrigatorio o filho precisa passar o valor desse atributo, usa-se o *super* para isso, abaixo exemplo passando valor de um atributo do filho para o pai.
```dart
void main() {
  var n = Sobrenome(a: 'JB');
  print(n.a);
}
// Classe pai exige valor para variavel nome
 class Nome {
  String nome;
  Nome({required this.nome});
}
// Classe filha recebe o valor na variavel a e passa o valor dela para a variavel nome do pai
class Sobrenome extends Nome {
  String a;
  Sobrenome({required this.a}) : super(nome : a);
}
```
- Exemplo com metódo e classe pai *abstract*
```dart
void main() {
  var animal = Cachorro(idade: 10);
  print(animal.idade);
  print(animal.calcularIdadeHumana());
  
}

abstract class Animal {
  Animal({this.idade = 0});
  int idade;
  int calcularIdadeHumana();
}

class Cachorro extends Animal {
  Cachorro({required int idade}) : super(idade: idade);
  @override
  int calcularIdadeHumana() {
    return idade * 7;
  }
}
```
## Covariant
- Para que uma classe seja aceita como tipo do seu pai, seu pai precisa ser ```covariante```.
- Abaixo temos o exemplo de um mamifero que come fruta, e em sequencia uma banana que é filha de fruta, para que essa banana seja aceita pelo mamifero(Macaco) se fez necessario o pai receber um tipo ```covariante```
  - ```dart
    abstract class Mamifero {
      void comer(covariant Fruta fruta);
    }

    class Fruta {}

    class Banana extends Fruta{}

    class Macaco extends Mamifero{
      @override
      void comer(Banana fruta) {}
    }
    ```
***
***

## Implements

- Como visto acima em [extends](./Classes_H_e_V.md#extends) quando uma classe é abstract, ela esta "ordenando" que outras classes que a estendem tenham caracteristicas suas caracteristicas
- O mesmo ocorre para classes que sao ```implements``` de outras classes, seus metodos passam a ser obrigatorios a implementação, porem caso haja algum metodo ja implementado na classe pai sera necessario uma nova implementação no filho, o que nao ocorre no extends pois metodos implementados no pai sao ignorados no filho.
- ```dart
  abstract class Carro {
    abstract int portas;
    // Metodo pai ja implementado
    void velocidadeMaxima(){}
  }
  class Gol implements Carro {
    @override
    int portas = 4;
    @override
    void velocidadeMaxima() {
      // Solicitando nova implementação do metodo pai
    } 
  }

  class Palio extends Carro {
    @override
    int portas = 4;
    // Ignorou o metodo implementado no pai
  }
  ```
***
***
## Mixin
- Usado para estender mais de uma classe, fazer um mix de heranças
- Classes que serão estendidas como mixins nao podem estender outras, precisam ser puras
- Metodos nas classes que contem o mesmo nome o ultimo executado sobrescreve o anterior.
- Considerando a classe principal artista
  - ```dart
    abstract class Artista {}
    ```
- Considerando a classe principal cantar
  - ```dart
    abstract class Cantar {}
    ```
- Considerando a classe secundaria dançar, onde determina que so pode estender se quem a estende tambem for um artista.
  - ```dart
    mixin Dancar on Artista {}
    ```
- Temos a classe João que ira herdar os dados das 3 classes
- Ele pode herdar a classe dançar pois ele tambem é um artista
- O metodo de importação abaixo mostrado seria da mesma forma caso a classe dançar nao tivesse restrição a artista
  - ```dart
    class Joao extends Artista with Dancar, Cantar{}
     ```
***
***

## Extensions

- É um tipo de classe usada pra adicionar função a outra função
- Exemplificando, quando se faz uma extensão de um objeto estou dizendo ao dart que itens daquele tipo terão acesso a classe extensora
  - No exemplo 4 temos uma classe que é uma extensão de *String*, logo a variavel do tipo deste tipo ou qualquer texto no codigo podera acessar a nova função criada na classe
- É possivel chamar metodos das classes que as estendem (exemplo 3)
- exemplo 1:
  ```dart
  extension ThemeExtension on BuildContext {
    Color get primaryColor => Theme.of(this).primaryColor;
    }
    ```
- Acima estou adicionando uma variavel que recebe a cor primaria de theme e estendendo esta variavel para o ```BuildContext```, assim posso acessar a cor primaria do app chamando o ```context.primaryColor``` apos efetuar a importação da classe ```ThemeExtension``` para o arquivo
- exemplo 2
  ```dart
  extension Texto on BuildContext {
    String get saudacao => 'JBS';
  }
  ```
- Chamando ```context.saudacao```, obtenho o valor *'JBS'*, uma string que poderia ser passada num ```print(context.saudacao)``` ou num ```Text(context.saudacao)```
- exemplo 3:
```dart
class Pessoa {
  String? nome;
  Pessoa({
    this.nome,
  });
}
extension PessoaExtension on Pessoa {
    String saudacao() {
    return 'Ola $nome bem vindo a academia';
  }
}
```
- Acima estou estendendo uma classe propria, passando o solicitado no parametro e obtendo o retorno da extenção
- Chamando ```print(Pessoa(nome: 'JB').saudacao());``` obtenho *Ola **JB** bem vindo a academia*
- exemplo 4:
```dart
extension saudacoesString on String {
  String saudacao() {
    return 'Ola $this bem vindo ao flutter';
  }
}
```
- Acima estou estendendo uma classe nativa, passando seu tipo e instanciando a função que a estende
- Chamando ```print('JB'.saudacao())``` obtenho *Ola **JB** bem vindo ao flutter*
- Chamando ```print('Silva'.saudacao());``` obtenho *Ola **Silva** bem vindo ao flutter*
