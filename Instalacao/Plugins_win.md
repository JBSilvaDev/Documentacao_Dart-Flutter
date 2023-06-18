# Instalação plugins para windows PowerShell
- Executar apos configuração de ambiente

***
## Downloads
- [powershell](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D)
- [windows terminal](https://www.microsoft.com/store/productId/9N0DX20HK701)
- [font CascadiaCode](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip)
- [oh-my-posh](https://apps.microsoft.com/store/detail/ohmyposh/XP8K0HKJFRXGCK)


## Shell
- Abrir e acessar configurações
  - Definir o terminal padrão
## CascadiaCode
- Abrir os arquivos e instalar
## Windows
- Acessar configurações e ativar modo dev
- Na mesma pagina ativar configuração de script do powershell
- Comando para modificar politicas de execução do powershell
  - ```ps
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```
## Instalações
- poshGit
  - ```ps
    Install-Module posh-git -Scope CurrentUser
    ```
  - Pressione A ou a para aceitar e instalar o pacote
  - ```ps
    Import-Module posh-git
    ```
- psReadLine
  - ```ps
    Install-Module PSReadLine -Force
    ```
  - Pressione A ou a para aceitar e instalar o pacote
  - ```ps
    Import-Module PSReadLine
    ```
- getChildItemColor
  - ```ps
    Install-Module -AllowClobber Get-ChildItemColor
    ```
  - Pressione A ou a para aceitar e instalar o pacote
  - ```ps
    Import-Module Get-ChildItemColor
    ```
- terminalIcons
  - ```ps
    Install-Module Terminal-Icons -Repository PSGallery
    ```
  - Pressione A ou a para aceitar e instalar o pacote
  - ```ps
    Import-Module Terminal-Icons
    ```
## Configurando powershell
- *code* é opcional serve para abrir o arquivo no vsCode
- Executar comando
  - ```ps
    code $PROFILE
    ```
  - Inserir os dados deste arquivo [ps1](.\win_plugins\Microsoft.PowerShel_profile.ps1)
- Executar comando
  - ```ps
    code $HOME\AppData\Local\oh-my-posh\spaceship.omp.json
    ```
  - Inserir os dados deste arquivo [json](.\win_plugins\spaceship.omp.json)
- Abrir configurações do powershell
  - Abrir arquivo json de configuração
  - Inserir os dados deste arquivo [json](.\win_plugins\settings.json)

