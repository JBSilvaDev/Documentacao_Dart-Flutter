# GetX

- Documentação Pt-BR: [Clique Aqui](https://github.com/jonataslaw/getx/blob/master/README.pt-br.md)

## Principais interações
- Instalação:
> No CMD
```dart
    flutter pub add get
```
> Diretamente no pubspec.yalm
```yaml
    dependencies:
        get: ^4.6.5
```
- Disponibilizar Get para aplicação
    - Substituir o `MaterialApp()` por `GetMaterialApp()`

### Gerencia de rotas
- Get [to](./Rotas/To.md)
- Get [back](./Rotas/Back.md)
- Get [off](./Rotas/Off.md)
- Get [offAll](./Rotas/OffAll.md)
- Get com [parametros](./Rotas/Enviando_Paramentros.md)
- Get com [rotas nomeadas](./Rotas/Rotas_Nomeadas.md)
- Get com [navigation 2.0](./Rotas/Navigation20.md) (BottomNavigationBar)

### Gerencia de dependencias
- Get [put and find](./GerenciamentoDeDependencias/basico_put_find.md) (basico)
- Get [lazyPut, fenix](./GerenciamentoDeDependencias/lazyput_fenix.md)
- Get [bindings](./GerenciamentoDeDependencias/Bindings/Descricao.md)

### Gerencia de estado
- Get [state manager](./GerenciamentoDeEstado/basico_state_manager.md) (basico)
- Get [tipos primitivos e variaveis](./GerenciamentoDeEstado/tipos_primitivos_variaveis.md)
- Get [GetX Controller](./GerenciamentoDeEstado/getx_controller.md)
- Get [GetX Widget](./GerenciamentoDeEstado/getx_widget.md)