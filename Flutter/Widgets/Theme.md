- Classe com contrutor privado criada para para configuração de tema
- Compoe:
    - Um metodo get static do tipo ThemeData que retorna um ThemeData
    - ThemeData contem diversos atributos de colorização e estilo, para os principais foi passado as cores e estilos que o projeto deve ter.
- Para aplicar o tema ir em [MaterialApp](../Principais/MateralApp.md) no atributo ```theme``` e passar o widget personalizado ```ThemaPersonalisado.theme```
- Para usar apenas um dos atributos, usar o desejado invocando o context de *Theme* ```Theme.of(context).ESTILO_DESEJADO```
- Para o textTheme foi usado o [GoogleFonts](../../Dependencias/Packages/google_fonts.md)
- Modelo
    ```dart
    class ThemaPersonalisado {
    ThemaPersonalisado._();

    static ThemeData get theme => ThemeData(
            textTheme: GoogleFonts.mandaliTextTheme(),
            primaryColor: Color(0xff5C77CE),
            primaryColorLight: Color(0xffABC8F7),
            backgroundColor: Color(0xFFFAFBFE),
            elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Color(0xff5C77CE),
            ),
            ),
        );
    }
    ```