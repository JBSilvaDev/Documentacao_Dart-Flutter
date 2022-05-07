# Media Query
-   Usado para obter informações sobre a tela do dispositivo
## Utlização
- Dentro do build da pagina definir uma variavel que ira receber informações da MediaQuery.of(context)
```dart
final midiaQuery = MediaQuery.of(context);
```
- Esta variavel ira conter diversas informações sobre o dispositivo, e para usa-las segue alguns exemplos:
- Para obter a largura do dispositivo (Largura total incluindo AppBar)
```dart
print('Largura ${midiaQuery.size.width}');
```
- Para obeter altura do dispositivo (Altura total incluindo AppBar)
```dart
print('Altura ${midiaQuery.size.height}');
```
- Para obter a orientação da tela do dispositivo (Portrait = Retrato e Landscape = Paisagem)
```dart
print('Orientacao ${midiaQuery.orientation}');
```
- Para obter o tamanho da barra de status (barra onde fica sinal, wifi, relogio...)
```dart
print('Status Bar ${midiaQuery.padding.top}');
```
- Para obter o tamanho da AppBar, tamanho padrão do flutter, caso haja alteração na configuração usa-se outro metodo
>Metodo 1
```dart
print('App Bar $kToolbarHeight');
```
>Metodo 2
```dart
final appbarra = AppBar();
print('App Bar ${appbarra.preferredSize.height}'); // Altura
print('App Bar ${appbarra.preferredSize.width}'); // Largura
```

- OBS: Para obter o tamanho disponivel da tela, basta subtrair o Total - Barra Status - AppBar
- OBS: Para trabalhar com responsividade deve-se usar porcentagem nos valores e nao numeros fixos
    -   Exemplo:
        - Considerando que querira que algo oculpe metade da altura de minha tela, sabendo que ela tem um total de AREA LIVRE (Total - Barra Status - AppBar) de 1000.
        > Errado
        ```dart
        Container(
            color: Colors.red,
            height: 500
        ```
        >Correto
        ```dart
        Container(
            color: Colors.red,
            height: (Total - Barra Status - AppBar) * .5,
        ```
