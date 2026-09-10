import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/app_colors.dart';

class AppTextStyle {
  static TextStyle title = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle corpoTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle buttonLebel = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle buttonLabel = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle smallGrey = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  static TextStyle smallGreen = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
  static TextStyle smallBlack = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
}
