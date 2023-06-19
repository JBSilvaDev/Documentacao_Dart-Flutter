# Funcoes com atalhos para shell
## Windows
- Exemplo de função powershell
  - Para este exemplo uso o comando de verificar ips na maquina
- Comando padrão
```ps
Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixLength
```
- Para criar uma função pra este comando usar
  ```ps
  code $PROFILE
  ```
   - Um arquivo .ps1 ira abrir no vsCode
   - Neste arquivo criar a função como abaixo
      ```ps1
      function meuip(){  
      Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, IPAddress, PrefixLength
      }
      ```
- Agora basta usar no powershell o comando `meuip` que ira obter o mesmo retorno do comando completo

## Mac
- Exemplo de alias no zsh
  - Para este exemplo uso o comando de verificar ips na maquina
- Comando padrão
  ```bash
  ifconfig | grep "inet " | awk '{print $1, $2, $4}'
  ```
- Para criar o alias no mac basta setar uma variavel do tipo alias no arquivo de configuração de variaveis de ambiente
  ```
  alias meuip="ifconfig | grep 'inet ' | awk '{print $1, $2, $4}'"
  ```
- Agora basta usar no powershell o comando `meuip` que ira obter o mesmo retorno do comando completo