# Classe de Tema Personalizado

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemaPersonalizado {
  TemaPersonalizado._();

  static ThemeData get theme {
    return ThemeData(
      textTheme: GoogleFonts.mandaliTextTheme(),
      primaryColor: const Color(0xff5C77CE),
      primaryColorLight: const Color(0xffABC8F7),
      backgroundColor: const Color(0xFFFAFBFE),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xff5C77CE),
        ),
      ),
    );
  }
}
```

Esta é uma classe de tema personalizado. Ela possui um construtor privado para configurar o tema. A classe contém os seguintes elementos:

- Um método estático chamado `theme` que retorna um objeto `ThemeData`. O `ThemeData` contém diversos atributos de colorização e estilo. Para os principais atributos, foram definidas as cores e estilos que o projeto deve ter.

Para aplicar o tema, você deve ir para o [MaterialApp](../Principais/MateralApp.md) e definir o atributo `theme` como o widget personalizado `TemaPersonalizado.theme`.

Para usar apenas um dos atributos, você pode acessá-los usando o `context` do `Theme`. Por exemplo, para acessar o estilo desejado, utilize `Theme.of(context).ESTILO_DESEJADO`.

No exemplo fornecido, o `textTheme` utiliza o pacote [GoogleFonts](../../Dependencias/Packages/google_fonts.md) para fornecer a fonte de texto chamada "Mandali".
