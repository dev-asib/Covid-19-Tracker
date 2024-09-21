import 'package:covid_19_tracker/presentation/utils/app_colors.dart';
import 'package:covid_19_tracker/presentation/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesCovidDataChart extends StatelessWidget {
  const WorldStatesCovidDataChart({
    super.key,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  final double totalCases;
  final double totalDeaths;
  final double totalRecovered;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {
        "Cases": totalCases,
        "Deaths": totalDeaths,
        "Recovered": totalRecovered,
      },
      animationDuration: const Duration(seconds: 2),
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      chartType: ChartType.ring,
      colorList: AppColors.chartColorList,
      chartRadius: SizeConfig.screenWidth! / 3.2,
      legendOptions: const LegendOptions(
        legendTextStyle: TextStyle(
          color: Colors.white,
        ),
        legendPosition: LegendPosition.left,
      ),
    );
  }
}
