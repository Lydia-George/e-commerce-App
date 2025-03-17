import 'package:flutter/material.dart';
class TColors{
  TColors._();
  // App Basic Colors
  static const Color primaryColor = Color(0xff5A7C76);
  static const Color primary = Color(0xff1976D2);
  static const Color secondaryColor = Color(0xffE9E3CB);
  static const Color third = Color(0xffE8FFFF);
  static const Color blackCard = Color(0xff434343);
  static const Color blueCard = Color(0xff29323C);
  static const Color pinkCard = Color(0xff3B41C5);
  static const Color teal = Color(0xff008080);
  static const Color inputField = Color(0xff5A7C76);

  //Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0, 0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xff5A7C76),
        Color(0xffE9E3CB),

  ]);

  //Text Colors
  static const Color textPrimary = Color(0xff5A7C76);
  static const Color textSecondary = Color(0xff272727);
  static const Color textWhite = Color(0xffE8FFFF);

  //Background Colors
  static const Color light = Color(0xffffffff);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xffCECFBB);

  //Background Container Colors
  static const Color lightContainer = Color(0xffE9E3CB);
  static const Color darkContainer = Color(0xff5A7C76);

  //border Colors
  static const Color borderPrimary = Color(0xff5A7C76);
  static const Color borderSecondary = Color(0xffE9E3CB);

  //Error and Validation Colors
static const Color error = Color(0xffD32f2f);
static const Color success = Color(0xff388E3C);
static const Color waring = Color(0xfff57c00);
static const Color info = Color(0xff1976D2);

//Neutral Shades
  static const Color black = Color(0xff232323);
  static const Color darkerGrey = Color(0xff4f4f4f);
  static const Color darkGrey = Color(0xff939393);
  static const Color grey = Color(0xffe0e0e0);
  static const Color softGrey = Color(0xfff4f4f4);
  static const Color lightGrey = Color(0xfff9f9f9);
  static const Color white = Color(0xffffffff);


}