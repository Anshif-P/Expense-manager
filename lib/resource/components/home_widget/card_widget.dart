import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/data/service/Data_base.dart';
import 'package:speedometer_chart/speedometer_chart.dart';
import '../../const/custom_color.dart';
import '../../const/text_style.dart';

class CustomFirstCardWidget extends StatelessWidget {
  final ValueNotifier<double> todayExpense;
  const CustomFirstCardWidget({super.key, required this.todayExpense});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper.instance.getTodayExpense();
    return Container(
      height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: CustomColors.greyBackgroundColor,
          borderRadius: BorderRadius.circular(6)),
      child: Row(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TODAYS EXPENSE',
                style: AppText.smallLight,
              ),
              const SizedBox(
                height: 8,
              ),
              ValueListenableBuilder(
                valueListenable: todayExpense,
                builder: (context, value, child) => Text(
                  '₹${todayExpense.value.toString()}',
                  style: AppText.semiLargeLight,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpeedometerChart(
              dimension: 110,
              minValue: 0,
              maxValue: 100,
              value: 75,
              minTextValue: 'Min. 0',
              maxTextValue: 'Max. 100',
              graphColor: [CustomColors.greenColor, Colors.yellow, Colors.red],
              pointerColor: Color.fromARGB(255, 239, 236, 236),
              animationDuration: 1,
              pointerWidth: 12,
              valueVisible: false,
              rangeVisible: false,
            ),
            Text(
              'Monthly Expense Meter',
              style: AppText.extraSmall,
            )
          ],
        ))
      ]),
    );
  }
}
