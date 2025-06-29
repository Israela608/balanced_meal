import 'package:flutter/material.dart';

@immutable
class AppColor {
  const AppColor._();

  // Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color ash = Color(0xFF959595);
  static const Color dark = Color(0xFF1E1E1E);

  static const Color background = Color(0xFFFBFBFB);
  static Color appBarShadow = Color(0xFFDEDEDE).withValues(alpha: 0.19);
  static Color cardShadow = Color(0xFF898989).withValues(alpha: 0.24);
  static Color dropdownShadow = Color(0xFF101828).withValues(alpha: 0.03);
  static Color dropdownShadow2 = Color(0xFF101828).withValues(alpha: 0.08);

  // Text
  static const Color textAsh = Color(0xFFDADADA);
  static const Color textAsh2 = ash;
  static const Color textDark = dark;
  static const Color textGrey = Color(0xFF474747);

  static const Color fillAsh = Color(0xFFEAECF0);
  static const Color borderAsh = fillAsh;

  // Primary
  static const Color primary = Color(0xFFF25700);

  // Secondary
  static const Color secondary = Color(0xFFFFEDE3);

  // Success
  static const Color success = Color(0xFF0F973D);

  // Error
  static const Color error = Color(0xFFCB1A14);
}
