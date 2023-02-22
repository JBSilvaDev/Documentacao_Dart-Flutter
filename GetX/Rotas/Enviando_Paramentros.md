# Get Paramentros
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
    // Pode-se passar o Get.arguments direto no Text(Get.arguments)
    Text('Getx: ${paramsGetx}');
```
- Em ambas as opções o valor passado por paramentro (arguments), sera enviado a pagina informada.

## Aguardando paramentros
- Faz a navegação para uma pagina a aguarda o retorno da mesma recebendo um paramentro enviado por ela
- Utilização nativa:
> Aguardando paramentro da proxima pagina
```dart
() async {
    final result = await Navigator.of(context).push(MaterialPageRouter(
        builder: (context) {
            return const PageName();
        },
    ));
}
print(result) // Retorno da pagina
    
```
> Enviando paramentro para pagina anterior
```dart
    Navigator.of(context).pop('Paramentro a ser enviado a pagina anterior');
```
***
- Utilização get
> Aguardando paramentro da proxima pagina
```dart
() async {
    final result = await Get.to(const AwaitParamsPage1());
    debugPrint(result);
},
```
> Enviando paramentro para pagina anterior
```dart
() async {
    Get.back(result: 'Retornando paramentro a pagina anterior com getx');
},
```


