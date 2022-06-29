# Dependências
## Conexão com BD 
- Dartion - [Local Server](https://pub.dev/packages/dartion)
    - Usado para criar servidor local com as informações do Json
      Para uso necessario configurar o Path do caminho (C:\Users\Usuario\AppData\Local\Pub\Cache\bin)
- Http - [HTTP](./Rest-RestFull/HTTP.md)
- MYSQL - [MySQL](./Rest-RestFull/MYSQL.md)
- SQLite - [SQLite](./Rest-RestFull/SQLite.md)
- SqfLite - [SqfLite](./Rest-RestFull/SqfLite.md)
***
## Localização de pastas
- Path - [Path](./Rest-RestFull/Path.md)
    - Usado para encontrar, definir caminho dos arquivos salvos pela aplicação
    - Modelo de utilização em [SQLite](../Dependencias/Rest-RestFull/SQLite/Modelos/database_sqlite.md)
***
## Formatação
- Formatação Moeda - [Currency Formatter](../Dependencias/Packages/Currency_formatter.md)
- Conversao de valores txt/num - [intl](../Dependencias/Packages/intl.md)
***
## Interação visual
- Device preview - [Preview](../Dependencias/Device_preview.md)
- Graficos tipo conometro/acelerador - [Gauges](../Dependencias/Packages/Gauges_Visual_Acelerometros.md)
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
## Gerenciamento de estado
- Provider - [Provider](./Provider.md)
***
