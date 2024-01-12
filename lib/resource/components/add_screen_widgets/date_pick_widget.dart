import 'package:flutter/material.dart';

import '../../const/custom_color.dart';
import '../../const/text_style.dart';

class DatePickingWidget extends StatelessWidget {
  TextEditingController dateController = TextEditingController();
  DatePickingWidget({super.key, required this.dateController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: AppText.mediumLight,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            datePick(context);
          },
          child: Container(
            height: 50,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: CustomColors.greyBackgroundColor,
              ),
            ),
            child: Center(
              child: TextField(
                controller: dateController,
                enabled: false, // Disable text editing
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.greyBackgroundColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.greyBackgroundColor)),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Select Date',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> datePick(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            datePickerTheme: DatePickerThemeData(
                confirmButtonStyle: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white)),
                cancelButtonStyle: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white))),
            primaryColor: CustomColors.blackColor,
            colorScheme: const ColorScheme.dark(
              primary: CustomColors.blackColor,
              onPrimary: Colors.white,
              surface: CustomColors.greyBackgroundColor,
              onSurface: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != dateController.text) {
      dateController.text = pickedDate.toString().split(' ')[0];
    }
  }
}
