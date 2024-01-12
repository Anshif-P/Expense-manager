import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/components/home_widget/temp_widget.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import 'package:mini_project_expense_manager/view/screen_add.dart';
import 'package:mini_project_expense_manager/view/total_statitics.dart';
import '../resource/components/home_widget/card_widget.dart';
import '../resource/components/home_widget/total_expense_card.dart';

ValueNotifier<double> todayExpense = ValueNotifier(0.0);
ValueNotifier<double> monthlyExpense = ValueNotifier(0.0);

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  List<Map<String, dynamic>> expenseIncomeIcons = [
    {
      'icon': Icons.beenhere_outlined,
      'text': 'Allowance',
      'color': const Color.fromARGB(255, 154, 241, 54)
    },
    {
      'icon': Icons.mood,
      'text': 'Bonus',
      'color': const Color.fromARGB(255, 54, 241, 179)
    },
    {
      'icon': Icons.restaurant,
      'text': 'Food',
      'color': const Color.fromARGB(255, 241, 54, 54)
    },
    {
      'icon': Icons.health_and_safety_outlined,
      'text': 'Health',
      'color': const Color.fromARGB(255, 104, 122, 130)
    },
    {
      'icon': Icons.money,
      'text': 'Petty Cash',
      'color': const Color.fromARGB(255, 241, 54, 241)
    },
    {
      'icon': Icons.attach_money,
      'text': 'Salary',
      'color': const Color.fromARGB(255, 241, 54, 54)
    },
    {
      'icon': Icons.shopping_cart,
      'text': 'Shopping',
      'color': const Color.fromARGB(255, 238, 241, 54)
    },
    {
      'icon': Icons.local_taxi,
      'text': 'Transportasion',
      'color': const Color.fromARGB(255, 51, 221, 178)
    },
    {
      'icon': Icons.build,
      'text': 'Utilities',
      'color': const Color.fromARGB(255, 203, 10, 135)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: AppText.mediumLight,
        ),
        actions: const [
          Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hello',
                    style: AppText.largeBold,
                  ),
                  Text(
                    ', welcome',
                    style: AppText.largeLight,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                valueListenable: todayExpense,
                builder: (context, value, child) => CustomFirstCardWidget(
                  todayExpense: todayExpense,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Total Expense',
                style: AppText.mediumLight,
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenStatistics())),
                  child: ValueListenableBuilder(
                      valueListenable: monthlyExpense,
                      builder: (context, value, child) =>
                          TotalExpenseCardWidget(
                            monthlyExpense: monthlyExpense,
                          ))),
              const SizedBox(
                height: 18,
              ),
              Text(
                'select here to add income and expense',
                style: AppText.mediumLight,
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                  height: 350,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DefaultTabController(
                          length: 2,
                          child: ScreenAdd(),
                        ),
                      ));
                    },
                    child: TempQuickAddwidget(
                      crossAxisCounts: 4,
                      itemCounts: 9,
                      listICons: expenseIncomeIcons,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
