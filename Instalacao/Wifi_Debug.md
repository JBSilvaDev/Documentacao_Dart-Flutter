# ADB WiFi

- Conectar via usb o celular
    - Com depuração usb ligada
- No terminal
    - ```
        adb tcpip 5555
        ```
- No celular
    - Clicar no celular para sempre permitir ( se for a primeira vez )
    - Obter endereço ip do celular
       - Rede > Config > Ip
- No terminal
   - ``` 
        adb connect <ipCelular>
        ```
- Remover cabo UBS e no terminal
    - ```
        adb devices
        ```
    - Se apontar o dispositivo na lista a depuração esta completa