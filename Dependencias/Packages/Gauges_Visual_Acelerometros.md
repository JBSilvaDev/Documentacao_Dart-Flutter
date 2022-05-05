>Usado para exibição de graficos do tipo acelerometros/conometros etc...
# Configuração
## No .yaml
>Documentação: <br>
[pub.dev](https://pub.dev/packages/syncfusion_flutter_gauges)<br>
```yaml
dependencies:
  syncfusion_flutter_gauges: ^19.4.55 # Ou versao desejada
```
## No arquivo
>Importar conteudo do package
```dart
import 'package:syncfusion_flutter_gauges/gauges.dart';
```
## Utilizazção
```dart
SfRadialGauge(
  // Inicialização do Gauge
  axes: [
    // Criação do gauge
    RadialAxis(
      // Ponteiro de incicação do valor
      pointers: <GaugePointer>[NeedlePointer(value: int 'Valor que ponteiro ira apontar')],
      // Anotacao no "grafico"
      annotations: <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Container(
                child: const Text('90.0',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            angle: 90,
            positionFactor: 0.5)],
      showAxisLine: false, // Para nao exibir linhas
      showLabels: false, // Para nao exibir textos
      showTicks: false, //Para nao exibir linhas de ponteiro
      minimum: 12.5, // Valor minimo do "grafico"
      maximum: 47.9, // Valor maximo do "grafico"
      // Exibição do conometro/grafico/acelerador
      ranges: [
        // Cada GaugeTange determina o inicio e fim de uma parte da composicao
        GaugeRange(
            startValue: 12,
            endValue: 18,
            color: Colors.blue,
            label: 'Texto',
            sizeUnit: GaugeSizeUnit.factor,
            labelStyle: GaugeTextStyle(
                fontFamily: 'Times', fontSize: 12),
            startWidth: 0.65,
            endWidth: 0.65)],),],),
```