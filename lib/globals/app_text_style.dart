import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headerTextStyle({Color color = Colors.white}) {
    return GoogleFonts.signikaNegative(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
  static TextStyle montserratStyle({Color color = Colors.white, double fontSize = 24}) {
    return GoogleFonts.signikaNegative(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: color,
    );
    // return GoogleFonts.yesevaOne(
    //   fontSize: fontSize,
    //   fontWeight: FontWeight.w800,
    //   color: color,
    // );
  }

  static TextStyle headingStyle({double fontSize = 36, Color color = Colors.white}) {
    return GoogleFonts.signikaNegative(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color:  color,
      letterSpacing: 2,
    );
  }
  static TextStyle normalStyle({double fontSize = 16, Color color = Colors.white}) {
    return GoogleFonts.signikaNegative(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color:  color,
      letterSpacing: 1.7,
    );
  }
  static TextStyle comfortaaStyle() {
    return GoogleFonts.signikaNegative(
        fontSize: 18, fontWeight: FontWeight.w800, color: Colors.grey);
  }
}