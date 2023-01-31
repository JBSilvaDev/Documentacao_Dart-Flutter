# JSON REST SERVER
>JRS é um pacote do dart que usamos para criar um backend local, usado para estudos com diversas possibilidades\
Docs: [Clique aqui](https://pub.dev/packages/json_rest_server)
## Instalação
- No terminal usar comando
    ```
    dart pub global activate json_rest_server
    ```
- Apos a instalação, um link `path` sera exibido no console, este caminho deve ser adicionado a variaveis de ambiente de seu dispositivos
    - Apos configurar, fechar e reabrir terminal, rodar comando `json_rest_server version`e verificar se a versão do package ira ser exibida
## Utilização
- Dentro da pasta do projeto em que deseje criar o fake backend execute o comando
    ```
    json_rest_server create ./backend
    ```
- Uma pasta "backend" sera criada com dois arquivos um `.yalm` e um `.json`
    - No arquivo `.yalm`pode ser configurado o nome do banco, a parta a qual ele ira responder, e o endereço local (0.0.0.0 ou localhost), tambem indica o arquivo json que sera usado como bd, no caso por padrao é o `database.json`.
    - No arquivo `.json` se trata de um json comum que é nosso backend, ele pode ser editado manualmente e/ou feito CRUD para manipulação de seu conteudo atravez do link local da api *Normalmente `localhost:8080`*.