import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import 'package:mini_project_expense_manager/view/screen_add.dart';
import '../../const/custom_color.dart';

class TempQuickAddwidget extends StatelessWidget {
  final int itemCounts;
  final int crossAxisCounts;
  final List<Map<String, dynamic>> listICons;

  List<ValueNotifier<bool>> selectedChec = [
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false),
    ValueNotifier(false)
  ];

  TempQuickAddwidget(
      {super.key,
      required this.crossAxisCounts,
      required this.itemCounts,
      required this.listICons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCounts),
      itemCount: itemCounts,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScreenAdd()));
          },
          child: ValueListenableBuilder(
            valueListenable: selectedChec[index],
            builder: (context, value, child) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: CustomColors.greyBackgroundColor,
                  border: Border.all(
                      color: selectedChec[index].value
                          ? listICons[index]['color']
                          : CustomColors.greyBackgroundColor),
                  borderRadius: BorderRadius.circular(6)),
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    listICons[index]['icon'],
                    color: listICons[index]['color'],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    listICons[index]['text'],
                    overflow: TextOverflow.ellipsis,
                    style: AppText.smallLight,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
