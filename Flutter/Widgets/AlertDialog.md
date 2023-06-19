# Classe Personalizada de Pop-up Interativa

```dart
import 'package:flutter/material.dart';

class PersonalizadoAlertDialog extends AlertDialog {
  PersonalizadoAlertDialog(BuildContext context, String task, int id)
      : super(
          title: Text('TÍTULO DO POP-UP'),
          content: Text('CORPO DO POP-UP'),
          actions: [
            // AÇÕES DO POP-UP
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Ação tomada ao clicar neste botão
                },
                child: Text('Sim'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Ação tomada ao clicar neste botão
                },
                child: const Text('Não'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        );
}
```

A classe `PersonalizadoAlertDialog` foi corrigida e formatada adequadamente. Agora ela estende `AlertDialog` e pode ser usada como um `showDialog` personalizado. No construtor da classe, são fornecidos três parâmetros cujos tipos podem variar dependendo da necessidade.

Dentro do construtor, o `super` chama o construtor da classe pai `AlertDialog` e define os valores padrão para o título, conteúdo e ações do pop-up. As ações são botões "Sim" e "Não" com suas respectivas ações ao serem clicados.

Lembre-se de importar a biblioteca `package:flutter/material.dart` para utilizar as classes necessárias.
