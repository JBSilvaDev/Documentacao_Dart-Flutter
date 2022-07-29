import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {

  final double imc;

  const ImcGauge({Key? key, required this.imc}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showAxisLine: false,
          showLabels: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
                color: Colors.blue, start: 12.5, end: 18.5, label: 'Magreza'),
            ImcGaugeRange(
                color: Colors.green, start: 18.5, end: 24.5, label: 'Normal'),
            ImcGaugeRange(
                color: Colors.yellow[500]!,
                start: 24.5,
                end: 29.9,
                label: 'Sobrepeso'),
            ImcGaugeRange(
                color: Colors.red[500]!,
                start: 29.9,
                end: 39.9,
                label: 'Obesidade'),
            ImcGaugeRange(
                color: Colors.red[900]!,
                start: 39.9,
                end: 47.9,
                label: 'Obesidade Grave'),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        )
      ],
    );
  }
}
