// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(children: [card]),
            Row(
              children: [card],
            )
          ],
        ),
      ),
    );
  }
}

Widget card = Expanded(
    child: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24),
  child: Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Data Visualisation",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "101908/MA3001",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 170,
                width: 170,
                child: SfCircularChart(
                  palette: const [
                    Color.fromARGB(255, 253, 216, 111),
                    Color.fromARGB(255, 143, 133, 255)
                  ],
                  series: <CircularSeries>[
                    DoughnutSeries<GDPData, String>(
                        cornerStyle: CornerStyle.bothCurve,
                        dataSource: getChartData(),
                        xValueMapper: (GDPData data, _) => data.continent,
                        yValueMapper: (GDPData data, _) => data.gdp)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  ),
));

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData("oceania", 300),
    GDPData("africa", 200),
  ];
  return chartData;
}
