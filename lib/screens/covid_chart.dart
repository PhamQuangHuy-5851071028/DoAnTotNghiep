import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CovidChart extends StatefulWidget {
  @override
  _CovidChartState createState() => _CovidChartState();
}

class _CovidChartState extends State<CovidChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    final List<CovidData> covidData = [
      CovidData('6/4', 77198),
      CovidData('25/6', 167056),
      CovidData('13/9', 308315),
      CovidData('2/12', 398366),
      CovidData('20/2', 533088),
      CovidData('11/5', 622108),
      CovidData('30/7', 623707),
      CovidData('8/8', 628361)
    ];
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
              child: SfCartesianChart(
                  tooltipBehavior: TooltipBehavior(
                      enable: true,
                      header: 'Số ca mới',
                      shouldAlwaysShow: true,
                      canShowMarker: true,
                      format: 'point.y'),
                  title: ChartTitle(
                      text: 'Biểu đồ số ca nhiễm mới trên thế giới\n',
                      textStyle: TextStyle(
                          color: Colors.purple[900],
                          fontWeight: FontWeight.w400)),
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    // Renders line chart
                    LineSeries<CovidData, String>(
                      dataSource: covidData,
                      xValueMapper: (CovidData data, _) => data.ngay,
                      yValueMapper: (CovidData data, _) => data.numbers,
                      isVisibleInLegend: true,
                    )
                  ]),
              // child: LineChart(
              //    mainData(),
              // ),
            ),
          ),
        ),
      ],
    );
  }

  // LineChartData mainData() {
  //   return LineChartData(
  //     gridData: FlGridData(
  //       show: true,
  //       drawVerticalLine: true,
  //       getDrawingHorizontalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xffd1d1db),
  //           strokeWidth: 1,
  //         );
  //       },
  //       getDrawingVerticalLine: (value) {
  //         return FlLine(
  //           color: const Color(0xffd1d1db),
  //           strokeWidth: 1,
  //         );
  //       },
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 10,
  //         getTextStyles: (value) =>
  //         const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 4:
  //               return '6/4';
  //             case 8:
  //               return '25/6';
  //             case 12:
  //               return '13/9';
  //             case 16:
  //               return '2/12';
  //             case 20:
  //               return '20/2';
  //             case 24:
  //               return '11/5';
  //             case 28:
  //               return '30/7';
  //           }
  //           return '';
  //         },
  //         margin: 4,
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.normal,
  //           fontSize: 12,
  //         ),
  //         getTitles: (value) {
  //           // switch (value.toInt())
  //           switch (value.toInt()) {
  //             case 0:
  //               return '0';
  //             case 2:
  //               return '200000';
  //             case 4:
  //               return '400000';
  //             case 6:
  //               return '600000';
  //             case 8:
  //               return '800000';
  //             case 10:
  //               return '1000000';
  //           }
  //           return '';
  //         },
  //         reservedSize: 40,
  //         margin: 8,
  //       ),
  //     ),
  //     borderData:
  //     FlBorderData(show: true, border: Border.all(color: const Color(0xff777e84), width: 1)),
  //     minX: 0,
  //     maxX: 29,
  //     minY: 0,
  //     maxY: 12,
  //     lineBarsData: [
  //       LineChartBarData(
  //         spots: [
  //           FlSpot(0, 0),
  //           FlSpot(4, 0.77198),
  //           FlSpot(8, 1.67056),
  //           FlSpot(12, 3.08315),
  //           FlSpot(16, 5.33088),
  //           FlSpot(20, 3.98366),
  //           FlSpot(24, 6.22108),
  //           FlSpot(28, 6.23707),
  //         ],
  //         isCurved: true,
  //         colors: gradientColors,
  //         barWidth: 5,
  //         isStrokeCapRound: true,
  //         dotData: FlDotData(
  //           show: true,
  //         ),
  //         belowBarData: BarAreaData(
  //           show: true,
  //           colors: gradientColors.map((color) => color.withOpacity(0.7)).toList(),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class CovidData {
  CovidData(this.ngay, this.numbers);
  final String ngay;
  final double numbers;
}
