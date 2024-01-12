import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/components/statitics_widget/graph_custom_widget.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

class ScreenTesting extends StatelessWidget {
  const ScreenTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SpeedometerChart(
            dimension: 100,
            minValue: 0,
            maxValue: 100,
            value: 75,
            minTextValue: 'Min. 0',
            maxTextValue: 'Max. 100',
            graphColor: [Colors.red, Colors.yellow, Colors.green],
            pointerColor: Colors.white,
            valueVisible: false,
            rangeVisible: true,
          ),
          CircularPercentIndicator(
            addAutomaticKeepAlive: true,
            radius: 75.0,
            lineWidth: 50,
            percent: 0.8,
            header: const Text("Icon header"),
            center: CircleAvatar(
                radius: 36,
                backgroundColor: CustomColors.greyBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Monthly',
                      style: AppText.extraSmallGrey,
                    ),
                    Text(
                      '₹1,058394',
                      style: AppText.smallLight,
                    )
                  ],
                )),
            backgroundColor: Colors.yellow,
            progressColor: Colors.teal,
          ),
          BarChartSample2()
        ],
      ),
    );
  }
}
