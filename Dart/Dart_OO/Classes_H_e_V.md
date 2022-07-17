# Heranças de [classes](Classes.md)

## extends

- Uma classe pode extender outra usando o extends
    - Essa nova classe vai herdar os atribubos, caracteriscas, etc... do que esta sendo extendido
    - Quando extendemos uma classe os metodos e atributos da classe *Pai* passam para o filho, abaixo exemplo a classe ```Sobrenome``` herdou a variavel nome de seu pai
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
- Quando temos um metódo nao implementado na classe pai obrigatoriamente ela se torna uma classe abstract, e seus hedeiros sao obrigados a implementar este metodo
    - ```dart
        abstract class Nome {
        String nome ();
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
    - O retorno é -> *Seu nome é JB*
- Quando um pai possui um atributo obrigatorio o filho precisa passar o valor desse atributo, usa-se o *super* para isso, abaixo exemplo passando valor de um atributo do filho para o pai.
```dart
void main() {
  var n = Sobrenome(a: 'JB');
  print(n.na());
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

## implements
- Como visto acima em [extends](./Classes_H_e_V.md#extends) quando uma classe é abstract, ela esta "ordenando" que outras classes que a extendem tenham caracteristicas suas caracteristicas
- O mesmo ocorre para classes que sao ```implements``` de outras classes, seus metodos passam a ser obrigatorios a implementação
- exemplo classe pai:

```dart
abstract class Animal {
  Animal({required this.idade});
  final int idade;
  int calcularIdadeHumana();
}
```

- exemplo classes extends filha que são obrigadas a terem um metodo ```calcularIdadeHumana()```

```dart
class Cachorro extends Animal {
  Cachorro({required int idade}) : super(idade: idade);
  @override
  int calcularIdadeHumana() {
      return idade * 7;
  }
}
class Gato extends Animal {
  Gato({required int idade}) : super(idade: idade);
  @override
  int calcularIdadeHumana() {
      return idade * 15;
  }
}
```

- Chamando ```Cachorro(idade: 1).calcularIdadeHumana());``` terei o retorno de **7**
- Chamando ```Gato(idade: 1).calcularIdadeHumana());``` terei o retorno de **15**
- Todas classes que extenderem uma abstract é obrigada a ter o metodo que seu pai pede, porem o que esse metodo ira fazer cada classe ira determinar suas proprias ações, acima a classe animal exige um calculo com base na idade humana, porem o calculo é diferente em cada um de seus filhos.

> Extensions

- É um tipo de classe que usa pra adicionar funcao a outra funcao
- É possivel chamar metodos das classes que as extendem (exemplo 3)
- exemplo 1:

  ```dart
  extension ThemeExtension on BuildContext {
    Color get primaryColor => Theme.of(this).primaryColor;
    }
    ```

- Acima estou adicionando uma variavel que recebe a cor primaria de theme e extendendo esta variavel para o buildercontext, assim posso acessar a cor primaria do app chamando o ```context.primaryColor``` apos efetuar a importação da classe ```ThemeExtension``` para o arquivo
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

- Acima estou extendendo uma classe propria, passando o solicitado no parametro e obtendo o retorno da extenção
- Chamando ```print(Pessoa(nome: 'JB').saudacao());``` obtenho *Ola **JB** bem vindo a academia*
- exemplo 4

```dart
extension saudacoesString on String {
  String saudacao() {
    return 'Ola $this bem vindo ao flutter';
  }
}
```

- Acima estou extendendo uma classe nativa, passando seu tipo e instanciando a funcao que a extende
- Chamando ```print('JB'.saudacao())``` obtenho *Ola **JB** bem vindo ao flutter*
