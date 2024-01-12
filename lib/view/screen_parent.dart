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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CircleAvatar(
      //   radius: 31,
      //   backgroundColor: CustomColors.bottomAddButtomGeyColor,
      //   child: Transform.scale(
      //     scale: .9,
      //     child: FloatingActionButton(
      //       elevation: 0,
      //       backgroundColor: CustomColors.greyBackgroundColor,
      //       onPressed: () async {},
      //       child: const Icon(
      //         Icons.add,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //     ),
      //   ),
      // ),
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
                // BottomBarItem(
                //   inActiveItem: Icon(
                //     Icons.add,
                //     color: Colors.white,
                //   ),
                //   activeItem: Icon(
                //     Icons.add,
                //     color: Colors.blueAccent,
                //   ),
                //   itemLabel: 'Page 2',
                // ),
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
                // BottomBarItem(
                //   inActiveItem: Icon(
                //     Icons.today_rounded,
                //     color: Colors.white,
                //   ),
                //   activeItem: Icon(
                //     Icons.today_rounded,
                //     color: Colors.blueAccent,
                //   ),
                //   itemLabel: 'Page 2',
                // ),
                // BottomBarItem(
                //   inActiveItem: SvgPicture.asset(
                //     'lib/asset/svg/dashboard.svg',
                //     color: Colors.blueGrey,
                //   ),
                //   activeItem: SvgPicture.asset(
                //     'lib/asset/svg/dashboard.svg',
                //     color: Colors.white,
                //   ),
                //   itemLabel: 'Page 3',
                // ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}




//////--------------------------------------------------------------------------------  basic one -----------------//

// class _ScreenParentState extends State<ScreenParent> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 0);

//   /// Controller to handle bottom nav bar and also handles initial page
//   final _controller = NotchBottomBarController(index: 0);

//   int maxCount = 5;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   /// widget list
//   final List<Widget> bottomBarPages = [
//     const ScreenHome(),
//     const ScreenAdd(),
//     const ScreenHistory(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//             bottomBarPages.length, (index) => bottomBarPages[index]),
//       ),
//       extendBody: true,
//       bottomNavigationBar: (bottomBarPages.length <= maxCount)
//           ? AnimatedNotchBottomBar(
//               /// Provide NotchBottomBarController
//               notchBottomBarController: _controller,
//               color: CustomColors.greyBackgroundColor,
//               showLabel: false,
//               // shadowElevation: 5,
//               // kBottomRadius: 28.0,
//               // notchShader: const SweepGradient(
//               //   startAngle: 0,
//               //   endAngle: pi / 2,
//               //   colors: [Colors.red, Colors.green, Colors.orange],
//               //   tileMode: TileMode.mirror,
//               // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
//               notchColor: Colors.black87,

//               /// restart app if you change removeMargins
//               removeMargins: false,
//               bottomBarWidth: 500,
//               durationInMilliSeconds: 300,
//               bottomBarItems: [
//                 const BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.home_filled,
//                     color: Colors.blueGrey,
//                   ),
//                   activeItem: Icon(
//                     Icons.home_filled,
//                     color: Colors.blueAccent,
//                   ),
//                   itemLabel: 'Page 1',
//                 ),
//                 const BottomBarItem(
//                   inActiveItem: Icon(
//                     Icons.star,
//                     color: Colors.blueGrey,
//                   ),
//                   activeItem: Icon(
//                     Icons.star,
//                     color: Colors.blueAccent,
//                   ),
//                   itemLabel: 'Page 2',
//                 ),

//                 ///svg example
//                 BottomBarItem(
//                   inActiveItem: SvgPicture.asset(
//                     'lib/asset/svg/dashboard.svg',
//                     color: Colors.blueGrey,
//                   ),
//                   activeItem: SvgPicture.asset(
//                     'lib/asset/svg/dashboard.svg',
//                     color: Colors.white,
//                   ),
//                   itemLabel: 'Page 3',
//                 ),
//               ],
//               onTap: (index) {
//                 /// perform action on tab change and to update pages you can update pages without pages
//                 // log('current selected index $index');
//                 _pageController.jumpToPage(index);
//               },
//               // kIconSize: 24.0,
//             )
//           : null,
//     );
//   }
// }
