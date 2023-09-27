import 'package:flutter/material.dart';

import 'palette.dart';
import 'app_text_style.dart';

class AppButtons{
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: Palette.bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Palette.mainColor,width: 2)
      ),
      height: 47,
      minWidth: 140,
      hoverColor: Palette.mainColor,
      focusElevation: 12,
      elevation: 6,
      splashColor: Palette.mainColor,
      child: Text(
        buttonName,
        style: AppTextStyle.headerTextStyle(fontSize: 12),
      ),
    );
  }
}