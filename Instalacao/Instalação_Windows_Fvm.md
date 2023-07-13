Fazer a instalação padrao pelo site ou [aki](Instalacao/Instalação_Windows.md)
usar comando do dart apos toda configuração
dart pub global activate fvm
configurar variavel de ambiente usando o link exibido apos o comando acima
add variavel de ambiente
fechar e reabrir o terminal
rodar fvm --version para verificar se foi instalado corretamente
rodar comando de configuração para definir pasta onde as versoes do fvm serao instaladas
fvm config 
fvm config --cache-path c:\fvm
comandos basicos
para instalar
fvm install {version}
para listar versoes instaladas
fvm list
para vericiar todas as versoes disponiveis do flutter
fvm releases
para selecionar uma versao (precisa esta com um projeto flutter aberto e dentro do terminal deste projeto usar o comando para selecionar a versao do flutter que sera usada nele)
fvm use {version}
para remover uma versao
fvm remove {version}
para configurar o vscode e dizer a versao que ira usar
https://fvm.app/docs/getting_started/configuration#vs-code
criar pasta .vscode
criar arquivo settings.json
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




