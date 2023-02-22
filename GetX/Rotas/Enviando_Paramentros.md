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
    Text('Getx: ${paramsGetx}');
```
- Em ambas as opções o valor passado por paramentro (arguments), sera enviado a pagina informada.

## Aguardando paramentros
- Faz a navegação para uma pagina a aguarda o retorno da mesma recebendo um paramentro enviado por ela
- Utilização nativa:
> Navegação padrão
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
```dart
    Navigator.of(context).pop('Paramentro a ser enviado a pagina anterior');
```
