# Classe Personalizada de pop-up interativa

- Classe que estende [AlertDialog](../Widgets/Dialogs.md#alertdialog) e pode ser usada como [showDialog-custon](../Widgets/Dialogs.md#custon-dialog)
- Em seu construtor pede 3 paramentros que seus tipos podem ser outros dependendo da necessidade.
- Em seu *super* foi passado os valores que serão padrão das tags do *AlertDialog*

```dart
class PersonalizadoAlertDialog extends AlertDialog {
  PersonalizadoAlertDialog(BuildContext context, String task, int id)
      : super(
          title: Text('TITULO DO POP-UP'),
          content: Text('CORPO DO POP-UP'),
          actions: [
            // AÇÕES DO POP-UP
            Padding(
              padding:  EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    // Ação tomada ao clicar neste botao
                  },
                  child: Text('Sim'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    // Ação tomada ao clicar neste botao
                  },
                  child: const Text('Não'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ],
        );
    }
```
