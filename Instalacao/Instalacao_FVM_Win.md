install choco - https://chocolatey.org/install
install dart sdk - choco install dart-sdk
CRIAR FVM_HOME colocar mesmo local
fvm realease 
fvm install <versions>
fvm list
em shell dev ou adm
fvm global <versao>
criara variavel no path %FVM_HOME%\default\bin
rodar flutter doctor
[!]warnigs de path podem ser ignorados
criar pasta .vscode com arquivo settigs.json dentro do projeto
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

fazer as instalações necessarias mostrada no arquivo de instalação do windows
setar as variaves que la mostra
usar flutter user<version> dentro do projeto para alterar a versao a ser usada nele, apos rodar flutter doctor


