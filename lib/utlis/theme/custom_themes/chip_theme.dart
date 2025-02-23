import 'package:ecommerce_app/utlis/constants/colors.dart';
import 'package:flutter/material.dart';
class TChipTheme{
  TChipTheme._();

  static ChipThemeData lightChipTheme = const ChipThemeData(
    disabledColor: TColors.secondaryColor,
    labelStyle: TextStyle(color:Colors.black),
    selectedColor: TColors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: TColors.secondaryColor,
  );
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: TColors.secondaryColor,
    labelStyle: TextStyle(color: TColors.secondaryColor),
    selectedColor: TColors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: TColors.secondaryColor,
  );

}