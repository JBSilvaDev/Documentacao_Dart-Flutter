# MobX Models
- Guia inicial MobX [aqui](../../Dependencias/MobX.md)
- Guia inicial Codegen [aqui](../../Dependencias/MobX_CodeGen.md)
- Pacote responsável por:
  - Receber valores atualizaveis
  - Notificar atualização de conteudo a tela
  - Informar ação que foi realizada para atualizar conteudo

Documentação oficial Português 
<br>[![pub package](https://img.shields.io/pub/v/mobx.svg?label=mobx&color=blue)](https://github.com/mobxjs/mobx.dart/blob/master/translation/pt-BR/README.md)

## Utilização
***
### Dados do arquivo de classe
> Executar os comandos passados no guia inicial apos definir esta classe
- No arquivo deve-se informar que o mesmo faz parte de outro arquivo que sera gerado automaticamente pelo ***CodeGen***
```dart
part 'nome_do_arquivo.g.dart';
```
- Uma classe é criada que ira receber outra classe que faz um mixin de ```_$ClasseCriada```
- Uma nova classe abstract foi criada, esta classe faz um mixin de *Store* que é uma classe do mobx
```dart
part 'controller_codegen.g.dart';
class ControllerCodeGen = ControllerCodegenBase with _$ControllerCodeGen;

abstract class ControllerCodegenBase with Store {}
```
***
OS DADOS ABAIXO SAO USADOS DENTRO DE UMA CLASSE ABSTRACT CRIADA ACIMA
***
### Observables
>Observable
- É a classe do mobx responsável por observar se o valor/conteudo foi alterado
- Com uso do Codegen usa-se o metadata ou notações para identificar o que cada atributo da classe é
```dart
@observable
int counter = 0;
```
>ObservableList
- É a classe do mobx responsável por observar alterações em conteudos de listas
```dart
ObservableList products = ObservableList();
// Usado para observar alterações no conteúdo de uma lista, outro método de usar é (var products = <Tipo>[].asObservable())
``` 
### Action
- É a classe do mobx responsável por ações que realizam atualizações em um valor/conteudo.
- Com uso do Codegen usa-se o metadata ou notações para identificar o que cada atributo da classe é
```dart
 @action
  void incremento() {
    counter++;
  }
```
#### Observers
>Observer
- É a classe do mobx reponsavel por reagir as ações tomadas
- Esta classe recebe a tag builder que recebe uma nova funcao onde seu retorno é o widget a ser atualizado conforme ações tomada.
- Exemplo abaixo mostra um ```Text()``` que seu conteudo é a variavel *contador* e sempre que uma ação é realizada nesta variavel o conteudo do *Text* muda pois o mesmo esta reagindo a ação realizada.
- OBS: Uma variavel que estancia a classe controladora onde possui a ação foi criada ```final controller = ContadorController();``` na pagina onde o ```Observer``` esta sendo usado
```dart
Observer(builder: (_) {
              return Text('${controller.contadorMaisUm}');
            }),
```

### Reactions
- Segue igual apontado em [MobX](./MobX_Modelo.md#reactions)


**Modelo completo** *[aqui](../Principais/mobx/contador_mobx_codegen/)*