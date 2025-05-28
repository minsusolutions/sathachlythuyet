import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget getRadialGauge() {
  return SfRadialGauge(
    title: GaugeTitle(
      text: 'Số lượng câu sai',
      textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
    ),
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 100,
        ranges: <GaugeRange>[
          GaugeRange(
            startValue: 0,
            endValue: 30,
            color: Colors.green,
            startWidth: 10,
            endWidth: 10,
          ),
          GaugeRange(
            startValue: 30,
            endValue: 70,
            color: Colors.orange,
            startWidth: 10,
            endWidth: 10,
          ),
          GaugeRange(
            startValue: 70,
            endValue: 100,
            color: Colors.red,
            startWidth: 10,
            endWidth: 10,
          ),
        ],
        pointers: <GaugePointer>[NeedlePointer(value: 20)],
        annotations: <GaugeAnnotation>[
          GaugeAnnotation(
            widget: Container(
              child: const Text(
                '90.0',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            angle: 90,
            positionFactor: 0.75,
          ),
        ],
      ),
    ],
  );
}

Widget getLinearGauge() {
  return Container(
    margin: EdgeInsets.all(10),
    child: SfLinearGauge(
      minimum: 0.0,
      maximum: 100.0,
      orientation: LinearGaugeOrientation.horizontal,
      majorTickStyle: LinearTickStyle(length: 20),
      axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
      axisTrackStyle: LinearAxisTrackStyle(
        color: Colors.cyan,
        edgeStyle: LinearEdgeStyle.bothFlat,
        thickness: 15.0,
        borderColor: Colors.grey,
      ),
    ),
  );
}
