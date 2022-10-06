# Classes
***
- Para heranças de classes -> [Classes Heranças e Variados](./Classes_H_e_V.md)
***

>Classes sao representações do mundo real dentro do dart, o famoso OBJETO <br>

## Criando uma classe

```dart
class NomeDaClasse {}
```

>Classes possuem caracteristicas e comportamentos

```dart
class NomeDaClasse{
    // Atributos / Caracteristicas
    String? nome;
    int? idade;
}
```

>Invocando/Instaciando uma classe
- Metodo de atribuir valores padrao
```dart
// Criando o Objeto
var variavel = NomeDaClasse();
// Passsando valores para os atributos do objeto
variavel.nome = 'Nome';
variavel.idade = 10;
```
- Metodo de atribuir valores em cascade notation
- O ';' vem apenas no final da notação nao em cada linha como normalmente é
```dart
var variavel = NomeDaClasse()
// Passsando valores para os atributos do objeto
  ..nome = 'Nome'
  ..idade = 10;
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

- Usa-se [get/set](./Get_Set.md) para acessar esses atributos privados
- Se a classe estiver no mesmo arquivo (não recomendado) que o *"invocador"* pode ser acessado diretamente

```dart
class NomeDaClasse {
String? nome; // Não privado, pode ser acessado diretamente como instancia da classe
int? _idade; // Privado, Nao pode ser acessado fora do arquivo onde a classe foi criada
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

- Chamada : ```Camiseta.recuperarNome('JB');```
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
- Construtores com *assets*
  - Asserts sao usados para fazer verificações dos parametros passados para um construtor
  - Abaixo exemplo de um assert onde se o nome passado for '' retorna um erro.
```dart
void main() {
  var cli = Asserts()..nome = '';

  print(cli.nome);
}

class Asserts {
  String? nome;

  Asserts({
    this.nome,
  }) : assert(nome == '', 'Nome não pode ser nulo ou vazio');
}
```

