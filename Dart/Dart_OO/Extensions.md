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
***