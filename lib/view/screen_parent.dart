//---------------------------- current one ----------------------------------------//

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_expense_manager/resource/const/custom_color.dart';
import 'package:mini_project_expense_manager/view/screen_history.dart';
import 'package:mini_project_expense_manager/view/screen_home.dart';

class ScreenParent extends StatefulWidget {
  const ScreenParent({Key? key}) : super(key: key);

  @override
  State<ScreenParent> createState() => _ScreenParentState();
}

class _ScreenParentState extends State<ScreenParent> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 2; // Set maxCount to the number of BottomBarItems you have

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    ScreenHome(),
    ScreenHistory(),

    // ScreenAdd(),
    // const ScreenTesting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              kIconSize: 13,
              kBottomRadius: 13,
              notchBottomBarController: _controller,
              color: CustomColors.greyBackgroundColor,
              notchColor: CustomColors.greyBackgroundColor,
              showLabel: false,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.dashboard,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.history,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.history,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
