import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomSnackBar(
  BuildContext context, {
  String title = '',
  required String message,
  bool isError = true,
}) {
  final snackBar = SnackBar(
    content: Container(
      padding: EdgeInsets.all(8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Text(
                isError ? 'Error' : title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: poppinsStyle(
                  fontSize: 18,
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          Text(
            message,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: poppinsStyle(
              fontSize: 14,
              color: AppColor.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
    backgroundColor: isError ? AppColor.error : AppColor.success,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
