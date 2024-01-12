import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/components/statitics_widget/progress_widget.dart';

import '../../const/text_style.dart';

class CompleteProgressIndicatorWidget extends StatelessWidget {
  final IconData icon;
  final String category;
  final String amount;
  final double ratio;
  final Color iconColor;
  final Color indicatorColor;

  const CompleteProgressIndicatorWidget(
      {super.key,
      required this.iconColor,
      required this.indicatorColor,
      required this.amount,
      required this.category,
      required this.ratio,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: iconColor,
              )),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            flex: 14,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: AppText.semiMediumLight,
                    ),
                    Text(
                      '₹ $amount',
                      style: AppText.semiMediumLight,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ProgressIndicatorWidget(
                      amount: ratio,
                      indicatorColor: indicatorColor,
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
