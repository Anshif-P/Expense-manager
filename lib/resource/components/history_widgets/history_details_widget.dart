import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/model/incom_expense_model.dart';

import '../../const/custom_color.dart';
import '../../const/text_style.dart';

class HistoryDetailsWidget extends StatefulWidget {
  final List<IncomAndExpenseModel> incomAndExpense;

  HistoryDetailsWidget({super.key, required this.incomAndExpense});

  @override
  State<HistoryDetailsWidget> createState() => _HistoryDetailsWidgetState();
}

class _HistoryDetailsWidgetState extends State<HistoryDetailsWidget> {
  List<Map<String, dynamic>> expenseIncomeIcons = [
    {
      'icon': Icons.restaurant,
      'text': 'Food',
      'color': const Color.fromARGB(255, 241, 54, 54)
    },
    {
      'icon': Icons.shopping_cart,
      'text': 'Shopping',
      'color': const Color.fromARGB(255, 238, 241, 54)
    },
    {
      'icon': Icons.build,
      'text': 'Utilities',
      'color': const Color.fromARGB(255, 203, 10, 135)
    },
    {
      'icon': Icons.health_and_safety_outlined,
      'text': 'Health',
      'color': const Color.fromARGB(255, 104, 122, 130)
    },
    {
      'icon': Icons.local_taxi,
      'text': 'Transportasion',
      'color': const Color.fromARGB(255, 51, 221, 178)
    },
    {
      'icon': Icons.attach_money,
      'text': 'Salary',
      'color': const Color.fromARGB(255, 241, 54, 54)
    },
    {
      'icon': Icons.mood,
      'text': 'Bonus',
      'color': const Color.fromARGB(255, 54, 241, 179)
    },
    {
      'icon': Icons.beenhere_outlined,
      'text': 'Allowance',
      'color': const Color.fromARGB(255, 154, 241, 54)
    },
    {
      'icon': Icons.money,
      'text': 'Petty Cash',
      'color': const Color.fromARGB(255, 241, 54, 241)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemBuilder: (context, index) {
          final data =
              widget.incomAndExpense[widget.incomAndExpense.length - 1 - index];
          final matchingIcon = expenseIncomeIcons
              .firstWhere((iconData) => iconData['text'] == data.category);

          return Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        matchingIcon['icon'],
                        color: matchingIcon['color'],
                      ))),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.category,
                        style: AppText.smallLight,
                      ),
                      Text(
                        data.date,
                        style: AppText.xSmall,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '₹${data.amount}',
                      style: AppText.mediumLight,
                    ),
                  ))
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: widget.incomAndExpense.length);
  }
}
