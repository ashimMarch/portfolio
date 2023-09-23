import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppButtons{
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap
  }) {
    return MaterialButton(
      onPressed: () {
        
      },
      color: AppColors.themeColor,
      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none
      ),
      height: 44,
      minWidth: 130,
      hoverColor: AppColors.aqua,
      focusElevation: 12,
      elevation: 6,
      splashColor: AppColors.lawGreen,
      child: Text(
        buttonName,
        style: AppTextStyle.headerTextStyle(),
      ),
    );
  }
}