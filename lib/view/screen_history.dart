import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/data/service/Data_base.dart';
import 'package:mini_project_expense_manager/model/incom_expense_model.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import '../resource/components/history_widgets/history_details_widget.dart';

class ScreenHistory extends StatelessWidget {
  ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: AppText.mediumLight,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Info',
              style: AppText.mediumLight,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: FutureBuilder(
                    future: DatabaseHelper.instance.getIncomeExpenseHistory(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(child: Text('Error fetching data'));
                      }
                      List<IncomAndExpenseModel>? data = snapshot.data;
                      return HistoryDetailsWidget(
                        incomAndExpense: data!,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
