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
- Usa-se get/set para acessalos
- Se a classe estiver no mesmo arquivo que o main pode ser acessado diretamente
- Se a classe estiver em arquivo separado so pode acessar com get/set
    - Neste get/set pode-se colocar alguma condicao para aceitar o valor passado ou nao
    - Exemplo abaixo se o valor da idade for iguaal a 0 retorna um erro e nao aceita
```dart
class NomeDaClasse {
// Caracteristica
String? nome;
int? _idade;
//Get/Set
int? get idade => _idade;
set idade(int? idade) {
    if (idade == 0) {
        throw Exception('Informe uma idade valida');
    }
}
}
```
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
>Herança - extends - super
- Uma classe pode extender outra usando o extends
    - Essa nova classe vai herdar os atribubos, caracteriscas, etc... do que esta sendo extendido
    - Ao extender uma classe em outra, se faz necessario passar as informações do "filho" para o "pai" utilizando a super junto com um construtor
```dart
class SobreNome extends NomeDaClasse{
  
  SobreNome(int idade) : super(idade);

}
```
