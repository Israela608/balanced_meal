import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isTextScale = false,
    this.onBackPress,
  });

  final String title;
  final bool isTextScale;
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h, bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.appBarShadow,
            blurRadius: 15.5.r,
            offset: Offset(0, 9.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPress,
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: getSvg(
                svg: 'chevron-left',
                height: 20,
                width: 20,
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textScaler: isTextScale ? null : TextScaler.noScaling,
              textAlign: TextAlign.center,
              style: AppStyle.titleStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
