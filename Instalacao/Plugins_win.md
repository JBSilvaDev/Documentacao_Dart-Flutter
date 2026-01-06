# Instalação de plugins para o Windows PowerShell

Este guia fornecerá instruções para a instalação de plugins no Windows PowerShell. Certifique-se de seguir as etapas após configurar o ambiente.

***

## Downloads

Antes de começar, faça o download dos seguintes arquivos:

- [PowerShell](https://www.microsoft.com/store/productId/9MZ1SNWT0N5D)
- [Windows Terminal](https://www.microsoft.com/store/productId/9N0DX20HK701)
- [Fonte Cascadia Code](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip)
- [Oh-My-Posh](https://apps.microsoft.com/store/detail/ohmyposh/XP8K0HKJFRXGCK)

## Configurando o Shell

1. Abra o Windows Terminal e acesse as configurações.
2. Defina o Windows Terminal como o terminal padrão.

## Instalando a fonte Cascadia Code

1. Abra o arquivo da fonte Cascadia Code que você baixou.
2. Instale a fonte em seu sistema.

## Configurações do Windows

1. Acesse as configurações do Windows.
2. Ative o "Modo de Desenvolvedor".
3. Na mesma página, ative a opção de configuração de script do PowerShell.
4. Execute o seguinte comando para modificar as políticas de execução do PowerShell:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## Instalação dos plugins

Abra o Windows PowerShell e execute os seguintes comandos para instalar os plugins:

1. PoshGit:
   ```powershell
   Install-Module posh-git -Scope CurrentUser
   ```
   Pressione "A" ou "a" para aceitar e instalar o pacote.
   ```powershell
   Import-Module posh-git
   ```

2. PSReadLine:
   ```powershell
   Install-Module PSReadLine -Force
   ```
   Pressione "A" ou "a" para aceitar e instalar o pacote.
   ```powershell
   Import-Module PSReadLine
   ```

3. Get-ChildItemColor:
   ```powershell
   Install-Module -AllowClobber Get-ChildItemColor
   ```
   Pressione "A" ou "a" para aceitar e instalar o pacote.
   ```powershell
   Import-Module Get-ChildItemColor
   ```

4. Terminal-Icons:
   ```powershell
   Install-Module Terminal-Icons -Repository PSGallery
   ```
   Pressione "A" ou "a" para aceitar e instalar o pacote.
   ```powershell
   Import-Module Terminal-Icons
   ```

## Configurando o PowerShell

Agora, vamos configurar o PowerShell com os arquivos fornecidos:

1. Execute o comando abaixo para abrir o arquivo de perfil do PowerShell no Visual Studio Code (opcional):
   ```powershell
   code $PROFILE
   ```
   

2. Execute o comando abaixo para abrir o arquivo spaceship.omp.json no Visual Studio Code:
   ```powershell
   code $HOME\AppData\Local\oh-my-posh\spaceship.omp.json
   ```
   Insira o conteúdo do arquivo [spaceship.omp.json](./win_plugins/spaceship.omp.json) no arquivo aberto.

3. Abra as configurações do PowerShell.
   - Abra o arquivo de configuração JSON.
   - Insira o conteúdo do arquivo [settings.json](./win_plugins/settings.json) no arquivo aberto.

Certifique-se de seguir as etapas com cuidado e conforme apresentado para configurar corretamente os plugins no Windows PowerShell.
