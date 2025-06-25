import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle abhayaLibreStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
  double? height,
  TextDecoration? decoration,
  Color? decorationColor,
  double? decorationThickness,
}) {
  return TextStyle(
    fontFamily: 'AbhayaLibre',
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    height: height?.h,
    decoration: decoration,
    decorationColor: decorationColor ?? color,
    decorationThickness: decorationThickness,
  );
}

TextStyle questrialStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
  double? height,
  TextDecoration? decoration,
  Color? decorationColor,
  double? decorationThickness,
}) {
  return TextStyle(
    fontFamily: 'Questrial',
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    height: height?.h,
    decoration: decoration,
    decorationColor: decorationColor ?? color,
    decorationThickness: decorationThickness,
  );
}

TextStyle poppinsStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
  double? height,
  TextDecoration? decoration,
  Color? decorationColor,
  double? decorationThickness,
}) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: fontSize.sp,
    color: color,
    fontWeight: fontWeight,
    height: height?.h,
    decoration: decoration,
    decorationColor: decorationColor ?? color,
    decorationThickness: decorationThickness,
  );
}

class AppStyle {
  static TextStyle? titleStyle(BuildContext context) => poppinsStyle(
        color: AppColor.textDark,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? subtitleStyle(BuildContext context) =>
      titleStyle(context)?.copyWith(fontSize: 14.sp);

  static TextStyle? bodyStyle(BuildContext context) => questrialStyle(
        color: AppColor.textGrey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle? hintStyle(BuildContext context) =>
      bodyStyle(context)?.copyWith(color: AppColor.textAsh2);

  static TextStyle? buttonTextStyle(BuildContext context) =>
      hintStyle(context)?.copyWith(fontWeight: FontWeight.w500);
}
