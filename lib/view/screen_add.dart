import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/data/service/Data_base.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';
import '../resource/components/add_screen_widgets/amount_add_widget.dart';
import '../resource/components/add_screen_widgets/date_pick_widget.dart';
import '../resource/components/add_screen_widgets/expense_card_widget.dart';
import '../resource/components/add_screen_widgets/note_widget.dart';
import '../resource/const/text_style.dart';

// ignore: must_be_immutable
class ScreenAdd extends StatelessWidget {
  ScreenAdd({
    super.key,
  });
  ValueNotifier<List<ValueNotifier<bool>>> selectedExpense = ValueNotifier([
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false)
  ]);
  ValueNotifier<List<ValueNotifier<bool>>> selectedIncome = ValueNotifier([
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false)
  ]);

  List<Map<String, dynamic>> expenseIcons = [
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
    }
  ];
  List<Map<String, dynamic>> incomeIcons = [
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
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: DefaultTabController(
        animationDuration: const Duration(seconds: 1),
        length: 2,
        child: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                        Text(
                          'Add Expense',
                          style: AppText.mediumLight,
                        ),
                        InkWell(
                          onTap: () {
                            addIncomAndExpense(context);
                          },
                          child: Text(
                            'Save',
                            style: AppText.mediumBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AmountAddCardWidget(
                      controller: amountController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Type',
                      style: AppText.mediumLight,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        dividerColor: Colors.black,
                        tabAlignment: TabAlignment.start,
                        indicator: BoxDecoration(
                          color: CustomColors.greyBackgroundColor,
                          border: Border.all(
                            color: Colors.blue, // Set the border color to blue
                            width: 1, // Set the border width
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(1),
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text('      Expense       '),
                            ),
                          ),
                          Tab(
                            child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(1),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: CustomColors.greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text('      Income      '),
                            ),
                          ),
                        ],
                        isScrollable:
                            true, // Allow the tab bar to occupy only the necessary width
                        indicatorSize: TabBarIndicatorSize
                            .label, // Make the indicator align with the label
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: 230,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ExpenseAndIcomeCardWidget(
                              expenseIncomIcons: expenseIcons,
                              selectedChec: selectedExpense),
                          ExpenseAndIcomeCardWidget(
                              expenseIncomIcons: incomeIcons,
                              selectedChec: selectedIncome),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DatePickingWidget(
                      dateController: dateController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NoteWidget(noteController: descriptionController),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void addIncomAndExpense(BuildContext context) async {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    String category = '';
    String description = descriptionController.text;
    String date = dateController.text;
    // Check if it is an expense or income
    if (DefaultTabController.of(context).index == 0) {
      // Expense
      for (int i = 0; i < selectedExpense.value.length; i++) {
        if (selectedExpense.value[i].value) {
          category = expenseIcons[i]['text'];
          break;
        }
      }

      await DatabaseHelper.instance
          .insertExpense(amount, category, description, date);
    } else {
      // Income
      for (int i = 0; i < selectedIncome.value.length; i++) {
        if (selectedIncome.value[i].value) {
          category = incomeIcons[i]['text'];
          break;
        }
      }

      await DatabaseHelper.instance
          .insertIncome(amount, category, description, date);
    }

    amountController.clear();
    dateController.clear();

    await DatabaseHelper.instance.printDatabase();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
