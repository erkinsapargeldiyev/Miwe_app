// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

// ignore: must_be_immutable
class MyChart extends StatelessWidget {
  int gowy;
  int suzwsyz;
  int keselli;
  int guran;
  int bellenmedik;
  MyChart({
    Key? key,
    required this.gowy,
    required this.suzwsyz,
    required this.keselli,
    required this.guran,
    required this.bellenmedik,
  }) : super(key: key);

  final double radius = 5;
  @override
  Widget build(BuildContext context) {
    final totalGardens = gowy + suzwsyz + keselli + guran + bellenmedik;

    return PieChart(
      duration: Duration(milliseconds: 1000),
      PieChartData(
        sections: [
          PieChartSectionData(
            showTitle: false,
            radius: radius,
            value: (gowy / totalGardens) * 100,
            color: AppColors.statusGreen,
          ),
          PieChartSectionData(
            showTitle: false,
            value: (suzwsyz / totalGardens) * 100,
            radius: radius,
            color: AppColors.statusBlue,
          ),
          PieChartSectionData(
            showTitle: false,
            value: (keselli / totalGardens) * 100,
            radius: radius,
            color: AppColors.statusYellow,
          ),
          PieChartSectionData(
            showTitle: false,
            value: (guran / totalGardens) * 100,
            radius: radius,
            color: AppColors.statusRed,
          ),
          PieChartSectionData(
            showTitle: false,
            value: (bellenmedik / totalGardens) * 100,
            radius: radius,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
