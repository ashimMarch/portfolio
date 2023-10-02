import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/globals/palette.dart';

class AppTextStyle {
  static TextStyle iconText({Color color = Colors.white, double fontSize = 15}) {
    return GoogleFonts.croissantOne(
      fontSize: fontSize,
      color: Palette.mainColor,
    );
  }
  static TextStyle headerTextStyle({Color color = Colors.white, double fontSize = 15}) {
    return GoogleFonts.croissantOne(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
  static TextStyle montserratStyle({Color color = Colors.white, double fontSize = 20}) {
    return GoogleFonts.croissantOne(//poppins
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle headingStyle({double fontSize = 36, Color color = Colors.white}) {
    return GoogleFonts.croissantOne(//poppins
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color:  color,
      letterSpacing: 2,
    );
  }

  static TextStyle normalStyle({double fontSize = 15, Color color = Colors.white}) {
    return GoogleFonts.amita(//       quintessential    // amita
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color:  color,
      letterSpacing: 1.7,
    );
  }
}

class GoogleFontStyle {
  static TextStyle whiteHeading(){
    return GoogleFonts.amita(//       quintessential    // amita
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color:  Palette.whiteColor,
      letterSpacing: 1.7,
    );
  }
  static TextStyle buttonStyle(){
    return GoogleFonts.croissantOne(//       quintessential    // amita
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color:  Palette.whiteColor,
    );
  }
  
  static TextStyle mainTitleText1(){
    return GoogleFonts.croissantOne(//       quintessential    // amita
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color:  Palette.whiteColor,
    );
  }

  static TextStyle mainTitleText2(){
    return GoogleFonts.croissantOne(//       quintessential    // amita
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color:  Palette.mainColor,
    );
  }
  static TextStyle mainSubTitle({double fontSize = 19, Color color = const Color(0xFFBDA9FF)}){
    return GoogleFonts.amita(//       quintessential    // amita
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color:  color,
    );
  }
}