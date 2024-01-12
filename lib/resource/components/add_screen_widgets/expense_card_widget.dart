import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/components/home_widget/quick_add_widget.dart';

import '../../const/text_style.dart';

class ExpenseAndIcomeCardWidget extends StatelessWidget {
  ExpenseAndIcomeCardWidget(
      {super.key, required this.expenseIncomIcons, required this.selectedChec});
  ValueNotifier<List<ValueNotifier<bool>>> selectedChec;
  List<Map<String, dynamic>> expenseIncomIcons;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: QuickAddWidget(
          crossAxisCounts: 3,
          itemCounts: 5,
          listICons: expenseIncomIcons,
          selectedChec: selectedChec,
        ));
  }
}
