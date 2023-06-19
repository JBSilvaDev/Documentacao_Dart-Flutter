# ADB WiFi

O ADB WiFi permite que você se conecte ao seu celular Android por meio de uma conexão sem fio usando o adb (Android Debug Bridge). Isso é útil quando você deseja depurar aplicativos Android sem a necessidade de um cabo USB. Siga as etapas abaixo para usar o ADB WiFi:

1. Conectar o celular via USB:
   - Certifique-se de que o celular esteja conectado ao computador usando um cabo USB.
   - Verifique se a opção de depuração USB está ativada nas configurações do celular.

2. No terminal:
   - Abra o terminal em seu computador.
   - Execute o seguinte comando:
     ```
     adb tcpip 5555
     ```
   Isso permitirá que o adb escute conexões na porta 5555.

3. No celular:
   - No celular, clique em "Permitir sempre" quando solicitado (caso seja a primeira vez que você está usando o ADB WiFi).
   - Obtenha o endereço IP do celular:
     - Vá para as configurações de rede no celular.
     - Selecione "Configurações de conexão" ou algo similar.
     - Procure o endereço IP do celular.

4. No terminal:
   - Execute o seguinte comando no terminal, substituindo `<ipCelular>` pelo endereço IP que você obteve anteriormente:
     ```
     adb connect <ipCelular>
     ```
   Isso estabelecerá a conexão entre o computador e o celular via WiFi.

5. Remover o cabo USB e verificar a conexão:
   - Desconecte o cabo USB do celular.
   - No terminal, execute o seguinte comando:
     ```
     adb devices
     ```
   - Se o seu dispositivo aparecer na lista de dispositivos, isso significa que a depuração está completa e você está conectado via WiFi.

Certifique-se de seguir essas etapas corretamente para estabelecer a conexão do ADB WiFi com sucesso. Isso proporcionará a você a flexibilidade de depurar seus aplicativos Android sem a restrição de um cabo USB.