import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/data/service/Data_base.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../const/custom_color.dart';
import '../../const/text_style.dart';
import 'category_text_widget.dart';

class TotalExpenseCardWidget extends StatelessWidget {
  final ValueNotifier<double> monthlyExpense;
  const TotalExpenseCardWidget({super.key, required this.monthlyExpense});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper.instance.getCurrentMonthExpense();
    return Container(
      width: double.maxFinite,
      height: 170,
      decoration: BoxDecoration(
          color: CustomColors.greyBackgroundColor,
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Expanded(
            child: CircularPercentIndicator(
              addAutomaticKeepAlive: true,
              radius: 67.0,
              lineWidth: 50,
              percent: 0.8,
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
                      ValueListenableBuilder(
                        valueListenable: monthlyExpense,
                        builder: (context, value, child) => Text(
                          '₹${value.toString()}',
                          style: AppText.smallLight,
                        ),
                      )
                    ],
                  )
                  //   },
                  // )
                  ),
              backgroundColor: Colors.yellow,
              progressColor: Colors.teal,
            ),

            ///
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoryTextWidget(
                    category: 'Transportation',
                    color: Colors.teal,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CategoryTextWidget(
                    category: 'Shopping',
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CategoryTextWidget(
                    category: 'Health',
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CategoryTextWidget(
                    category: 'Other',
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
