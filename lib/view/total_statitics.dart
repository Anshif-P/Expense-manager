import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import '../resource/components/statitics_widget/graph_widget.dart';
import '../resource/components/statitics_widget/total_progress_widget.dart';

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          'Statitics',
          style: AppText.mediumLight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const GraphWidget(),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Income',
            style: AppText.smallLight,
          ),
          const SizedBox(
            height: 10,
          ),
          CompleteProgressIndicatorWidget(
              amount: '3,000',
              category: 'Other',
              icon: Icons.ac_unit,
              ratio: 0.8,
              iconColor: Colors.blueGrey.shade400,
              indicatorColor: Colors.blueGrey.shade400),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Expense',
            style: AppText.smallLight,
          ),
          const SizedBox(
            height: 10,
          ),
          const CompleteProgressIndicatorWidget(
            amount: '1,340',
            category: 'Transportation',
            icon: Icons.car_repair_rounded,
            ratio: 0.6,
            iconColor: Color.fromARGB(255, 0, 105, 93),
            indicatorColor: Color.fromARGB(255, 0, 105, 93),
          ),
          const SizedBox(
            height: 10,
          ),
          const CompleteProgressIndicatorWidget(
            amount: '340',
            category: 'Transportation',
            icon: Icons.shopping_cart,
            ratio: 0.2,
            iconColor: Colors.yellow,
            indicatorColor: Colors.yellow,
          )
        ]),
      ),
    );
  }
}
