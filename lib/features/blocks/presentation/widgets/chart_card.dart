// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:miwe/colors/app_colors.dart';

import 'package:miwe/const_views/widgets/pie_chart.dart';

class CardChart extends StatelessWidget {
  final String groupNo;
  final int gowyInt;
  final int suwsyzInt;
  final int keselliInt;
  final int guranInt;
  final int bellenmedikInt;

  const CardChart({
    Key? key,
    required this.groupNo,
    required this.gowyInt,
    required this.suwsyzInt,
    required this.keselliInt,
    required this.guranInt,
    required this.bellenmedikInt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalGardens =
        bellenmedikInt +
        gowyInt +
        suwsyzInt +
        keselliInt +
        guranInt +
        bellenmedikInt;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.8,
            blurRadius: 3,
            offset: Offset(0.8, 3),
          ),
        ],
      ),
      height: 200,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  width: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        groupNo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.green[900],
                        ),
                      ),
                      MyChart(
                        gowy: gowyInt,
                        suzwsyz: suwsyzInt,
                        keselli: keselliInt,
                        guran: guranInt,
                        bellenmedik: bellenmedikInt,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Umumy agaçlaryn sany',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                ),
                Text(
                  totalGardens.toString(),
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: Column(
              children: [
                Text(
                  'Agaçlar barada maglumat',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChartInfoWidget(
                        text: 'Gowy- $gowyInt',
                        color: AppColors.statusGreen,
                      ),
                      ChartInfoWidget(
                        text: 'Suwsyz- $suwsyzInt',
                        color: AppColors.statusBlue,
                      ),
                      ChartInfoWidget(
                        text: 'Keselli- $keselliInt',
                        color: AppColors.statusYellow,
                      ),
                      ChartInfoWidget(
                        text: 'Guran- $guranInt',
                        color: AppColors.statusRed,
                      ),
                      ChartInfoWidget(
                        text: 'Bellenmedik- $bellenmedikInt',
                        color: AppColors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartInfoWidget extends StatelessWidget {
  final String text;
  final Color color;
  const ChartInfoWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            children: [
              CircleAvatar(backgroundColor: color, maxRadius: 8),
              SizedBox(width: 10),
              SizedBox(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
