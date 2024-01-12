import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/components/statitics_widget/graph_custom_widget.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: CustomColors.greyBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      child: BarChartSample2(),
    );
  }
}
