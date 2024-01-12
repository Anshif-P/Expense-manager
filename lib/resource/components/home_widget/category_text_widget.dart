import 'package:flutter/material.dart';

import '../../const/text_style.dart';

class CategoryTextWidget extends StatelessWidget {
  final String category;
  final Color color;

  const CategoryTextWidget(
      {super.key, required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6,
          backgroundColor: color,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          category,
          style: AppText.smallLight,
        ),
      ],
    );
  }
}
