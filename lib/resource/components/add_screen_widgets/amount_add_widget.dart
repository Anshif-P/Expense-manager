import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';
import 'package:mini_project_expense_manager/resource/const/text_style.dart';

class AmountAddCardWidget extends StatelessWidget {
  final TextEditingController controller;

  const AmountAddCardWidget({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: CustomColors.greyBackgroundColor),
      alignment: Alignment.center,
      height: 110,
      width: double.maxFinite,
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            child: TextField(
              controller: controller,
              style: AppText.largeLight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelStyle: AppText.mediumLight,
                  hintText: '₹ 00.00',
                  hintStyle: AppText.mediumGrey,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
