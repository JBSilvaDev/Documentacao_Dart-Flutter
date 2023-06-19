# Get Parâmetros

- Navegação comum com parâmetros.
- Utilização nativa:
> Envio
```dart
Navigator.of(context).push(MaterialPageRoute(
  builder: (context) {
    return const PageName();
  },
  settings: RouteSettings(
    arguments: 'Parâmetro a ser enviado aqui (Object)',
  ),
));
```
> Recebimento - variável dentro do BuildContext
```dart
final paramsNative =
    ModalRoute.of(context)?.settings.arguments ?? 'Valor se nulo';
```
```dart
Text('Nativo: $paramsNative');
```
***
- Utilização com GetX
> Envio
```dart
Get.to(const PageName(), arguments: 'Parâmetro a ser enviado aqui (Object)');
```
> Recebimento - variável dentro do BuildContext
```dart
final paramsGetx = Get.arguments ?? 'Valor se nulo';
```
```dart
// Também é possível usar diretamente Get.arguments no Text(Get.arguments)
Text('GetX: $paramsGetx');
```
- Em ambas as opções, o valor passado como parâmetro (arguments) será enviado para a página informada.

## Aguardando Parâmetros

- Navega para uma página e aguarda o retorno da mesma, recebendo um parâmetro enviado por ela.
- Utilização nativa:
> Aguardando parâmetro da próxima página
```dart
() async {
  final result = await Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return const PageName();
    },
  ));
  print(result); // Retorno da página
}
```
> Enviando parâmetro para a página anterior
```dart
Navigator.of(context).pop('Parâmetro a ser enviado para a página anterior');
```
***
- Utilização com GetX:
> Aguardando parâmetro da próxima página
```dart
() async {
  final result = await Get.to(const AwaitParamsPage1());
  debugPrint(result);
}
```
> Enviando parâmetro para a página anterior
```dart
() async {
  Get.back(result: 'Retornando parâmetro para a página anterior com GetX');
}
```