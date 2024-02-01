import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff3D0548);
Color secondaryColor = const Color(0xff9b9b9b);
ThemeData theme = ThemeData.light().copyWith(
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(width: 5,color: primaryColor)),
      foregroundColor: primaryColor,

      textStyle: const TextStyle(
          color: Colors.white,
          fontFamily: "Alexandria",
          fontSize: 18,fontWeight: FontWeight.bold
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: primaryColor,
      textStyle: const TextStyle(
        color: Colors.white,
        fontFamily: "Alexandria",
        fontSize: 18,fontWeight: FontWeight.bold
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),

    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: primaryColor, fontFamily: "Alexandria"),
    bodyLarge: TextStyle(color: primaryColor, fontFamily: "Alexandria"),
  ),
  inputDecorationTheme: InputDecorationTheme(
    counterStyle: TextStyle(color: primaryColor, fontFamily: "Alexandria"),
    contentPadding: const EdgeInsets.all(5),
    alignLabelWithHint: true,
    hintStyle: TextStyle(color: secondaryColor, fontFamily: "Alexandria",),
    suffixIconColor: secondaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15,
      ),
      borderSide: BorderSide(
        color: secondaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15,
      ),
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
  ),
  indicatorColor: primaryColor,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryColor,
      textStyle: const TextStyle(
          color: Colors.white,
          fontFamily: "Alexandria",
          fontSize: 15,fontWeight: FontWeight.bold
      ),
    ),
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: TextStyle(color: primaryColor, fontFamily: "Alexandria"),
    iconColor: primaryColor,
  ),
  appBarTheme: AppBarTheme(
    color: primaryColor,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: "Alexandria",
    ),
  ),
  iconTheme: IconThemeData(
    color: primaryColor,
  ),
);
