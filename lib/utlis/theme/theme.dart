import 'package:ecommerce_app/utlis/theme/custom_themes/appbar_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/outlined_button_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/text_field_theme.dart';
import 'package:ecommerce_app/utlis/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Popins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Popins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme, // is a TextField Theme
  );


}