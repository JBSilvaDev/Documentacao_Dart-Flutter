# Gerenciamento de estado
## setState()
- Usado para atualizar valores, imagens widgets componentes em geral em tela
- Usa-se [Statefull](../Fundamentos.md#tipos-basicos-widgets) pois a tela nao tera somente valores fixos
## Utilização
- Chama-se a funcao anonima setState passando em seu conteudo o valor que precisa ser atualizado.
```dart
var valor = 0;

setState((){
    valor = 10;
});
```
- A funcao setState() pode ser passada diretamente dentro de um onPressed ou similar, ou dentro de alguma funcao para ser execultado com ou sem parametros da mesma, ou num [Duration](../Widgets/WidgetsTree.md#duration) para ser execultado de tempos em tempos.
- Este processo é muito rapido para conseguir ver algo acontecer as vezes é necessario efetuar um timer com o [Duration](../Widgets/WidgetsTree.md#duration)
- setState não é viavel para enviar dados para outra tela ou widget pai, pois o mesmo da um rebuild na tela por completo.<br><br>
- Caso o valor quando for fazer uma nova atualização precise ser "resetado" usar a funcao dispose() => Controladores de [formularios](../Widgets/Forms.md#form) por exemplo
- Em seu corpo passar o que precisa ser "resetado" .dispose(), dependendo da aplicação ira precisar resetar a pagina como um todo, passando o super.dispose().
```dart
@override
void dispose(){
    valor.dispose();
    super.dispose();
}
```