# Get to
- Navegação comum com paramentros
- Utilização nativa:
> Envio
```dart
    Navigator.of(context).push(MaterialPageRouter(
        builder: (context) {
            return const PageName();
        },
        settings: const RouterSettings(
            arguments: 'Paramentro a ser enviado aqui (Object)'
        )
    ));
```
> Recebimento, variavel dentro do BuildContext
```dart
    final paramsNative = ModelRouter.of(context)?.settings.arguments ?? 'Valor se nulo';
```
```dart
    Text('Nativo: ${paramsNative}');
```
***
- Utilização get
> Envio
```dart
    Get.to(const PageName(), arguments: 'Paramentro a ser enviado aqui (Object)');
```
> Recebimento, variavel dentro do BuildContext
```dart
    final paramsGetx = Get.arguments ?? 'Valor se nulo';
```
```dart
    Text('Getx: ${paramsGetx}');
```
- Em ambas as opções o valor passado por paramentro (arguments), sera enviado a pagina informada.