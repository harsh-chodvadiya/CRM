import 'package:crm/src/constant/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          // BarChart(
          //   BarChartData(
          //     barTouchData: barTouchData(context),
          //     titlesData: titlesData,
          //     borderData: FlBorderData(show: false),
          //     barGroups: barGroups,
          //     gridData: const FlGridData(show: false),
          //     alignment: BarChartAlignment.spaceAround,
          //     maxY: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
