import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../const/custom_color.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double amount;
  final Color indicatorColor;

  const ProgressIndicatorWidget(
      {super.key, required this.amount, required this.indicatorColor});

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      value: amount,
      backgroundColor: CustomColors.greyBackgroundColor,
      //specify only one: color or gradient
      //color:Colors.red,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [indicatorColor, indicatorColor],
      ),
    );
  }
}
