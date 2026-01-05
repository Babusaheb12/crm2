//
// import 'package:flutter/cupertino.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class CircularChart extends StatelessWidget {
//   final List<DataPoint> data;
//
//   CircularChart(this.data);
//
//   @override
//   Widget build(BuildContext context) {
//     return charts.PieChart(
//       _createChartData(),
//       animate: true,
//       animationDuration: Duration(milliseconds: 500),
//       defaultRenderer: charts.ArcRendererConfig(
//         arcWidth: 60,
//         arcRendererDecorators: [charts.ArcLabelDecorator()],
//       ),
//     );
//   }
//
//   List<charts.Series<DataPoint, String>> _createChartData() {
//     return [
//       charts.Series<DataPoint, String>(
//         id: 'chart',
//         domainFn: (DataPoint dataPoint, _) => dataPoint.category,
//         measureFn: (DataPoint dataPoint, _) => dataPoint.value,
//         colorFn: (DataPoint dataPoint, _) => dataPoint.color,
//         data: data,
//       ),
//     ];
//   }
// }
//
import 'dart:ui';

class DataPoint {
  final String category;
  final int value;
  final Color color;

  DataPoint(this.category, this.value, this.color);
}