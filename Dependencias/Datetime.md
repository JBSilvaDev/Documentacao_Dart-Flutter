# Date Time Picker
>Usado para exibição de calendario.<br>
Docs: [Clique aqui](https://pub.dev/packages/date_time_picker)<br>
## Utilização
- Importar dependencias no arquivo pubspec.yaml
```yaml
dependencies:
    date_time_picker: "^2.1.0" #(Ou qualquer outra versão na documentação)
```
- Efetuar o import no arquivo
```dart
import 'package:date_time_picker/date_time_picker.dart';
```
## Utilização
```dart
DatePicker(              
    DateTime.now() //Data inicial,
    height: // altura
    locale: 'pt-BR', //Local referencia
    initialSelectedDate: //Data inicial selecionada,
    selectionColor: //Cor ao selecionar,
    selectedTextColor: //Cor texto selecionado,
    daysCount: //Tamanho do calendario em dias,
    monthTextStyle: //Tamanho texto mes
    dayTextStyle: //Tamanho texto dia
    dateTextStyle: //Tamanho texto dia da semana
    onDateChange: (date) {
    context.read<HomeController>().filterByDay(date);
    },
);
```