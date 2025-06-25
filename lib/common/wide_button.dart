import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    super.key,
    required this.text,
    this.isBlack = false,
    this.backgroundColor = AppColor.primary,
    this.textColor = AppColor.white,
    this.isEnabled = true,
    this.isNoTextScale = false,
    this.verticalPadding,
    required this.onPressed,
  });

  final String text;
  final bool isBlack;
  final Color backgroundColor;
  final Color textColor;
  final bool isEnabled;
  final bool isNoTextScale;
  final double? verticalPadding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding?.h ?? 18.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isEnabled ? backgroundColor : AppColor.fillAsh,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            text,
            textScaler: isNoTextScale ? TextScaler.noScaling : null,
            style: isEnabled
                ? poppinsStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
                : AppStyle.buttonTextStyle(context),
          ),
        ),
      ),
    );
  }
}
