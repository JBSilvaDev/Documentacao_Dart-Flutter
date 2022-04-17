# Trabalhando com arquivos
Toda leitura de arquivo é feita pelo pacote [dart.io](https://api.dart.dev/stable/2.16.1/dart-io/dart-io-library.html), esta importação de pacote deve ser feita manualmente sem ajuda da IDE para evitar importação de pacote errado, ou caso deseje usar a IDE a seu favor prestar bastante atenção ao que esta sendo importado por ela<br>
Em caso de leituras assincrona nao esquecer de o main ou classe onde estara fazendo a leitura em um Future com [async](./Dart_OO/Async.md).

## Leitura
- Importando o pacote io do dart
    - ```dart
        import 'dart:io';
      ```
- Arquivo de leitura [read](./files/read.txt)
- Passando o arquivo que sera feita a leitura
    - ```dart
        var file = File('files/read.txt')
      ```
- É possivel fazer leitura de arquivos de 3 metodos diferentes.
>Metodo 1
- Leitura sincrona
    - ```dart
        var fileDataS = file.readAsStringSync();
        print(fileDataS);
        ```
- Ira efetuar a leitura de todo arquivo
>Metodo 2
- Leitura assincrona
    - ```dart
        var fileDataAs = await file.readAsString();
        print(fileDataAs);
        ```
- Ira efetuar a leitura de todo arquivo
>Metodo 3
- Leitura linhas (sincrona & assincrona)
    - ```dart
        // Leitura linha sincrona
        var fileDataLS = file.readAsLinesSync();
        print(fileDataLS);
        print(fileDataLS[1]);
        // Leitura linha assincrona
        var fileDataLAS = await file.readAsLines();
        print(fileDataLAS);
        print(fileDataLAS[0]);
        ```
- Ira ler as linhas do arquivo retornando uma lista onde cada linha é um index.
## Escrita
- Passando o local onde fará a escrita
    - ```dart
        var file = File('files/write.txt')
      ```
>Metodo 1 - Criação e escrita
- Escreve no arquivo informado
    - Ira sobrescrever o arquivo [original](./files/write.txt).
    - Caso o arquivo nao exista ira criar um com o nome passado no File().
        - ```dart
            await file.writeAsString('Ademia do flutter\n');
            ```
>Metodo 2 - Criação, escrita e adiciona novo conteudo
- Escreve no arquivo informado
    - Caso o arquivo nao exista ira criar um com o nome passado no File().
    - NÃO ira sobrescrever o arquivo [original](./files/write.txt).
        - ```dart
            // Sincrona
            await file.writeAsString('Curso de Dart/Flutter\n', mode: FileMode.append);
            // Assincrona
            file.writeAsStringSync('Curso de Dart/Flutter\n', mode: FileMode.append);
            ```
>Metodo 3 - Criação e escrita de itens de uma lista em arquivos 
- Escreve no arquivo informado
    - Ira sobrescrever o arquivo [original](./files/write-multiple-texts.txt).
    - Caso o arquivo nao exista ira criar um com o nome passado no File().
        - ```dart
            var listaNomes = ['JB', 'Graci', 'Dylan'];
            var file2 = File('files/write-multiple-texts.txt');
            var writeFile = file2.openWrite();
            listaNomes.forEach((nome) => writeFile.write('nome: $nome\n'));
            ```
- Escreve cada item da lista dando quebra de linha entre eles (\n).
>Metodo 4 - Criação, escrita de itens de uma lista em arquivos e adiciona novo conteudo
- Escreve no arquivo informado
    - Caso o arquivo nao exista ira criar um com o nome passado no File().
    - NÃO ira sobrescrever o arquivo [original](./files/write-and-add-multiple-texts.txt).
        - ```dart
            var listaIdades = [30, 35, 4];
            file2 = File('files/write-and-add-multiple-texts.txt');
            var writeFile2 = file2.openWrite(mode: FileMode.append);
            listaIdades.forEach((idade) => writeFile2.write('Idades: $idade\n'));
            ```
    - Escrita com base em um [mapa](./files/file-map.txt)
        - ```dart
            var mapa = <String, dynamic>{"nome": "JB", "idade": 30};
            var fileMap = File('files/file-map.txt');
            var escritafile = fileMap.openWrite(mode: FileMode.append);
            mapa.forEach((key, value) => escritafile.write('$key: $value\n'));
            ```
- Escreve cada item da lista dando quebra de linha entre eles (\n).