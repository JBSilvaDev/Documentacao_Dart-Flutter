# Classes
>Classes sao representações do mundo real dentro do dart, o famoso OBJETO<br>
## Criando uma classe
```dart
class NomeDaClasse {}
```
>Classes possuem caracteristicas e comportamentos
```dart
class NomeDaClasse{
    // Atributos / Caracteristicas
    String? nome;
    int? idade;;
}
```
>Invocando/Instaciando uma classe
```dart
// Criando o Objeto
var variavel = NomeDaClasse();
// Passsando valores para os atributos do objeto
variavel.nome = 'Nome';
variavel.idade = 10;
```
>É possivel criar funcoes dentro das classes (metodos)
```dart
class NomeDaClasse{
    // Metodo
    String tipoDeNome() {
        if (nome == 'Nome') {
        return 'Nome recebido';
        } else {
        return 'Nome nao recebido';
        }
    }
}
```
>Atributos com _ a frente de seu nome, sao privados
- Usa-se get/set para acessados
- Se a classe estiver no mesmo arquivo que o main pode ser acessado diretamente
- Se a classe estiver em arquivo separado so pode acessar com get/set
    - Neste get/set pode-se colocar alguma condicao para aceitar o valor passado ou nao
    - Exemplo abaixo se o valor da idade for igual a 0 retorna um erro e nao aceita
```dart
class NomeDaClasse {
// Caracteristica
String? nome;
int? _idade;
// Get/Set
int? get idade => _idade;
set idade(int? idade) {
    if (idade == 0) {
        throw Exception('Informe uma idade valida');
    }
}
}
```
>Atributos statics devem ser imutaveis, e sao acessados diretamente instaciando a classe, nao sendo necessario criar o objeto em uma variavel
- statics por serem atributos da classe, porem ser instanciados diretamente, sem a necessidade de criar um objeto da classe.
- static só podem acessar static
- Se um static for alterado, todos os objetos criados pela classe irão receber o novo valor
- Exemplo de atributo:
```static const nomeAtributo = 'ValorDoAtributo';```
- Exemplo de metodo: 
```dart
  static const String nome = 'Camiseta';
  static void recuperarNome(String n) => print('$nome de $n');
 ```
 - Chamada : ```Camiseta.recuperarNome('JB'); ```
 - Resultado = ***Camiseta de JB***
>Contrutores
- Por padrão contrutor tem o mesmo nome que a classe
- Seguem o mesmo padrao das funcoes
```dart
// Metodo completo
class NomeDaClasse {
  String? nome;
  int? idade;

  NomeDaClasse(String constructorNome, int constructorIdade) {
    idade = constructorIdade;
    nome = constructorNome;
  }

}
```
```dart
// Metodos abreviado
class NomeDaClasse {
  String? nome;
  int? idade;

  NomeDaClasse(this.nome, this.idade);
}
```
- Contrutores tipo factory
    - Sao contrutores onde pode criar uma regra antes de criar um novo objeto
    - Abaixo ao passar um nome para o contrutor ele contatena o nome passado com _SobreNome
```dart
class NomeDaClasse {
  String? nome;
  int? idade;

  NomeDaClasse();

  factory NomeDaClasse.regra(String nomeRegra) {
    var nome = nomeRegra + '_SobreNome';
    var novaClasse = NomeDaClasse();
    novaClasse.nome = nome;
    return novaClasse;
  }
}
```
- Construtor para atributos reservados
```dart
class NomeDaClasse {
  String? nome;
  int _idade;

  NomeDaClasse(int idadeConstrutor) : _idade = idadeConstrutor;
}
```
>Herança - extends - super - abstract - implements
- Uma classe pode extender outra usando o extends
    - Essa nova classe vai herdar os atribubos, caracteriscas, etc... do que esta sendo extendido
    - Ao extender uma classe em outra, se faz necessario passar as informações do "filho" para o "pai" utilizando a super junto com um construtor
```dart
class SobreNome extends NomeDaClasse{
  
  SobreNome(int idade) : super(idade);

}
```
- Quando uma classe é abstract, ela esta "ordenando" que outras classes que a extendem (modelo acima) tenha caracteristicas
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
- 

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

