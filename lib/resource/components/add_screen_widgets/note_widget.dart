import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';

import '../../const/text_style.dart';

class NoteWidget extends StatelessWidget {
  NoteWidget({super.key, required this.noteController});
  TextEditingController noteController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'Note',
          style: AppText.mediumLight,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: CustomColors.greyBackgroundColor,
            ),
          ),
          child: TextField(
            style: AppText.mediumLight,
            controller: noteController,
            decoration: InputDecoration(
                enabled: true,
                labelStyle: AppText.mediumLight,
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColors.greyBackgroundColor)),
                hintText: 'Enter note here',
                hintStyle: AppText.smallDark,
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: CustomColors.greyBackgroundColor))),
          ),
        )
      ],
    );
  }
}
