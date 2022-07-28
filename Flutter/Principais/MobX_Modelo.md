# MobX Models
- Guia inicial [aqui](../../Dependencias/MobX.md)
- Pacote responsável por:
  - Receber valores atualizaveis
  - Notificar atualização de conteudo a tela
  - Informar ação que foi realizada para atualizar conteudo

Documentação oficial Português 
<br>[![pub package](https://img.shields.io/pub/v/mobx.svg?label=mobx&color=blue)](https://github.com/mobxjs/mobx.dart/blob/master/translation/pt-BR/README.md)

## Utilização
***
>MobX é baseado em 3 pilares
- [Observador](./MobX_Modelo.md#observable)
- [Ação](./MobX_Modelo.md#action)
- [Reação](./MobX_Modelo.md#observer)

### Observable
- É a classe do mobx responsável por observar se o valor/conteudo foi alterado
- Pode ou nao ser tipada, assim como pode ou nao receber uma tag *name* que pode facilitar em caso de erros encontrar o observador que esta com problemas
```dart
var _contador = Observable<int>(0, name: 'Nome deste item para identificar em caso de erros (opcional)');
```
- Exemplo de erro que identifica pelo nome do observador
  - ![](../../Img/mobxErro1.png)
### Action
- É a classe do mobx responsável por ações que realizam atualizações em um valor/conteudo
- Normalmente iniciada como *late* pois a ação pode ser iniciada posteriormente, nao juntamente com a classe pai.
- Abaixo exemplo de ação tomada, sempre que a ação é chamada invoca a funcao ```addMaisUmFuncao``` e adiciona +1 ao valor atual da variavel *_contador*
- Iniciando ação
```dart
late Action contadorMaisUm;
```
- Função que ira chamar a ação a ser tomada e passa o co conteúdo para classe *Action*
```dart
ContadorController() {
    contadorMaisUm = Action(addMaisUmFuncao);
  }
```
- Função passada para *Action* executar
```dart
void addMaisUmFuncao() {
    _counter.value++;
    }
```
### Observer
- É a classe do mobx reponsavel por reagir as ações tomadas
- Esta classe recebe a tag builder que recebe uma nova funcao onde seu retorno é o widget a ser atualizado conforme ações tomada.
- Exemplo abaixo mostra um ```Text()``` que seu conteudo é a variavel *contador* e sempre que uma ação é realizada nesta variavel o conteudo do *Text* muda pois o mesmo esta reagindo a ação realizada.
- OBS: Uma variavel que estancia a classe controladora onde possui a ação foi criada ```final controller = ContadorController();``` na pagina onde o ```Observer``` esta sendo usado
```dart
Observer(builder: (_) {
              return Text('${controller.contadorMaisUm}');
            }),
```

**Modelo completo** *[aqui](../../Apps/contador_mobx/)*