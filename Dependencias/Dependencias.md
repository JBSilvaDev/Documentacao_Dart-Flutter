# Dependências
## Conexão com BD 
- Dartion - [Local Server](https://pub.dev/packages/dartion)
    - Usado para criar servidor local com as informações do Json
      Para uso necessario configurar o Path do caminho (C:\Users\Usuario\AppData\Local\Pub\Cache\bin)
- Http - [HTTP](./Rest-RestFull/HTTP.md)
- MYSQL - [SQL](./Rest-RestFull/MYSQL.md)
## Formatação
- Formatação Moeda - [Currency Formatter](./Dependencias/Currency_formatter.md)
- Conversao de valores txt/num - [intl](./Dependencias/intl.md)
## Interação visual
- Device preview - [Preview](../Dependencias/Device_preview.md)
- Graficos tipo conometro/acelerador - [Gauges](./Dependencias/Gauges_Visual_Acelerometros.md)
***
## Verificação de plataforma em uso
- Importar pacote
```dart
import 'dart:io';
```
- If para verificação
```dart
if (Platform.isIOS) {
    print('é IOS');
}else if(Platform.isWindows){
    print('é windows');
}
```
- Demais:
    - isAndroid
    - isLinux
    - isMacOS
    - isWindows
    - isIOS
***
