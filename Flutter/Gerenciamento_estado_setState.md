# Gerenciamento de estado
## setState()
- Usado para atualizar valores, imagens widgets componentes em geral em tela
- Usa-se [Statefull](./Flutter_Topicos.md#tipos-basicos-widgets) pois a tela nao tera somente valores fixos
## Utilização
- Chama-se a funcao anonima setState passando em seu conteudo o valor que precisa ser atualizado.
```dart
var valor = 0;

setState((){
    valor = 10;
});
```
- Caso o valor quando for fazer uma nova atualização precise ser "resetado" usar a funcao dispose() => Controladores de [formularios](./Apoio_Widgets/Forms.md#form) por exemplo
- Em seu corpo passar o que precisa ser "resetado" .dispose(), dependendo da aplicação ira precisar resetar a pagina como um todo, passando o super.dispose().
```dart
@override
void dispose(){
    valor.dispose();
    super.dispose();
}
```
- A funcao setState() pode ser passada diretamente dentro de um onPressed ou similar, ou dentro de alguma funcao para ser execultado com ou sem parametros da mesma, ou num [Duration](./Apoio_Widgets/WidgetsTree.md#duration) para ser execultado de tempos em tempos.