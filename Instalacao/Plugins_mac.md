# Instalação de plugins para o ZSH no macOS

Este guia fornecerá instruções para a instalação de plugins no ZSH do macOS. Certifique-se de seguir as etapas após configurar o ambiente.

***

## Instalações

Antes de prosseguir, verifique se você já instalou os seguintes componentes:

- [ZSH](./Plugins.md#zsh)
- [Oh My Zsh](./Plugins.md#oh-my-zsh)
- [zsh-syntax-highlighting](./Plugins.md#zsh-syntax-highlighting)
- [zsh-autosuggestions](./Plugins.md#zsh-autosuggestions)

## ZSH

1. Instalação do ZSH:
   ```
   brew install zsh
   ```

2. Definir o ZSH como o shell padrão:
   ```
   chsh -s /usr/local/bin/zsh
   ```

   > Com o Terminal aberto no Mac, vá para Terminal > Preferências e clique em Geral.
   > Em "Shells abrem com", selecione "Comando (caminho completo)" e digite o caminho para o shell que deseja usar.

## Oh My Zsh

1. Instalação do Oh My Zsh:
   ```
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

2. Feche o Terminal para salvar as alterações.

## zsh-syntax-highlighting

1. Instalação do zsh-syntax-highlighting:
   ```
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
   ```

2. Configuração:
   - Abra o arquivo `.zshrc` (local onde estão as variáveis de ambiente).
   - Procure pela linha `plugins=(...)`.
   - Adicione `zsh-syntax-highlighting` entre os parênteses.
   - O Terminal agora exibirá comandos com destaque de sintaxe.
   - ![Exemplo zsh-syntax-highlighting](../Img/zsh-syntax-highlighting.png)

## zsh-autosuggestions

1. Instalação do zsh-autosuggestions:
   ```
   git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
   ```

2. Configuração:
   - Abra o arquivo `.zshrc` (local onde estão as variáveis de ambiente).
   - Procure pela linha `plugins=(...)`.
   - Adicione `zsh-autosuggestions` entre os parênteses.
   - O Terminal agora fornecerá sugestões automáticas de comandos.
   - ![Exemplo zsh-autosuggestions](../Img/zsh-autosuggestions.png)

Certifique-se de seguir as etapas com cuidado e conforme apresentado para instalar corretamente os plugins no ZSH do macOS.