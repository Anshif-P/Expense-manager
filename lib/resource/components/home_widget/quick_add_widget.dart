import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';
import '../../const/custom_color.dart';

class QuickAddWidget extends StatelessWidget {
  final int itemCounts;
  final int crossAxisCounts;
  final List<Map<String, dynamic>> listICons;

  ValueNotifier<List<ValueNotifier<bool>>> selectedChec;

  QuickAddWidget(
      {super.key,
      required this.crossAxisCounts,
      required this.itemCounts,
      required this.selectedChec,
      required this.listICons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCounts),
      itemCount: listICons.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // selectedChec.value[index].value = !selectedChec.value[index].value;
            for (int i = 0; i < selectedChec.value.length; i++) {
              selectedChec.value[i].value = false;
            }

            // Select the current item
            selectedChec.value[index].value = true;
          },
          child: ValueListenableBuilder(
            valueListenable: selectedChec.value[index],
            builder: (context, value, child) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: CustomColors.greyBackgroundColor,
                  border: Border.all(
                      color: selectedChec.value[index].value
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
