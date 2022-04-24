```dart
import 'package:dart_consumo_de_api/subindo_backend_dartion/controller/alunos_controller.dart';

void main() {
  AlunosController().findAll();
  AlunosController().findById("6e15f8d0-c19e-11ec-a4fe-ef3a76fb1eae");
  AlunosController().update('1');
  AlunosController().insert();
}
```
