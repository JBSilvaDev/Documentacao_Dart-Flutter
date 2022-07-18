# Gerenciamento de estado
- Cubit => [Bloc Cubit](./Cubit.md)
## Bloc
- Usado para gerenciamento de estado, baseado em [streams](../../Dart/Dart_OO/Streams.md)
- Bloc trabalha com 3 arquivos
  - Regra de negocio
  - Estado
  - Evento
- Usado conceito Part/Part
### Regra de negocio
- Este arquivo complementa os arquivos de evento e estado é usado ```part 'nomeArquivoEvent.dart'```, *o arquivo deve esta na mesma pasta*
