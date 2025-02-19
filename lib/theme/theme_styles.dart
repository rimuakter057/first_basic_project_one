import 'package:flutter/material.dart';

import '../utils/colors.dart';

ThemeData theme = ThemeData(
  colorSchemeSeed:AppColors.primaryColor,
inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: Colors.blueGrey.shade50,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: AppColors.primaryColor,width: 1
    ),

  ),
  focusedBorder:  OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: AppColors.black.withOpacity(.1)
    ),

  ),
  hintStyle: TextStyle(
    color:AppColors.grey
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 16.0,
    horizontal: 12.0,
  ),

),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleMedium:TextStyle(
        fontSize: 18,
        color: AppColors.grey,
        fontWeight: FontWeight.w400
    ),
    bodySmall: TextStyle(
        fontSize: 14,
        color: AppColors.black
    ),
    titleSmall: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.primaryColor,
        fixedSize:const Size.fromWidth(double .maxFinite),

        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
        foregroundColor: AppColors.white,
        textStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w500
        )
    )
  )

);
