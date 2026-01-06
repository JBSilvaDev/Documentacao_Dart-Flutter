# Instalação e Configuração do FVM (Flutter Version Manager) no Windows

## Pré-requisitos

Fazer a instalação padrão pelo site ou [aqui](./Instalação_Windows.md).

## Instalação

1. Use o comando do Dart após toda a configuração inicial:
    ```powershell
    dart pub global activate fvm
    ```

2. Configure a variável de ambiente:
    - Copie o caminho exibido no terminal após o comando acima.
    - Adicione este caminho às variáveis de ambiente do sistema.
    - Feche e reabra o terminal.

3. Verifique a instalação:
    ```powershell
    fvm --version
    ```

## Configuração

Defina a pasta onde as versões do FVM serão instaladas (cache):

```powershell
fvm config --cache-path c:\fvm
```

## Comandos Básicos

- **Instalar uma versão:**
    ```powershell
    fvm install {version}
    ```

- **Listar versões instaladas:**
    ```powershell
    fvm list
    ```

- **Verificar todas as versões disponíveis do Flutter:**
    ```powershell
    fvm releases
    ```

- **Selecionar uma versão:**
    (Precisa estar com um projeto Flutter aberto e dentro do terminal deste projeto)
    ```powershell
    fvm use {version}
    ```

- **Remover uma versão:**
    ```powershell
    fvm remove {version}
    ```

## Configuração do VSCode

Para configurar o VSCode e indicar a versão a ser usada, consulte a [documentação oficial](https://fvm.app/docs/getting_started/configuration#vs-code) ou siga os passos abaixo:

1. Crie a pasta `.vscode` na raiz do projeto.
2. Crie o arquivo `settings.json` dentro dela com o seguinte conteúdo:

```json
{
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  // Remove .fvm files from search
  "search.exclude": {
    "**/.fvm": true
  },
  // Remove from file watching
  "files.watcherExclude": {
    "**/.fvm": true
  }
}
```
