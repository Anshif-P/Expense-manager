import 'package:flutter/material.dart';
import 'custom_color.dart';

class AppText {
  static TextStyle get xSmall => TextStyle(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: Colors.grey[500],
      );
  static TextStyle get smallDark => const TextStyle(
        fontSize: 15,
        color: Color.fromARGB(255, 132, 132, 132),
      );

  static TextStyle get smallLight => const TextStyle(
        fontSize: 12,
        color: CustomColors.whiteColor,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get extraSmall => const TextStyle(
        fontSize: 11,
        color: CustomColors.whiteColor,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get extraSmallGrey => TextStyle(
        fontSize: 11,
        color: Colors.grey.shade400,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get mediumdark => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.lightGreyColor,
      );
  static TextStyle get darkTerms => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: CustomColors.blackColor,
      );
  static TextStyle get mediumLight => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get semiMediumLight => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get mediumGrey => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade400,
      );
  static TextStyle get mediumBlue => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: CustomColors.blueColor,
      );
  static TextStyle get largeDark => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.mainColor,
      );
  static TextStyle get dark => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: CustomColors.blackColor,
      );
  static TextStyle get largeBold => const TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      );
  static TextStyle get largeLight => const TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      );
  static TextStyle get semiLargeLight => const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );

  static TextStyle get xLarge => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: CustomColors.mainColor,
      );
}
