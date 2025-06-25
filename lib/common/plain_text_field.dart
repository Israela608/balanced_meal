import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlainTextField extends StatelessWidget {
  const PlainTextField({
    super.key,
    required this.textController,
    this.labelText = '',
    required this.hintText,
    this.suffixText,
    required this.textInputAction,
    this.inputFormatters,
    this.validatorCallback,
    this.onChangedCallback,
    this.onSavedCallback,
  });

  final TextEditingController textController;
  final String labelText;
  final String hintText;
  final String? suffixText;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validatorCallback;
  final Function(String)? onChangedCallback;
  final Function(String?)? onSavedCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              labelText,
              style: AppStyle.subtitleStyle(context),
            ),
          ),
        TextFormField(
          controller: textController,
          validator: validatorCallback,
          onChanged: (text) {
            if (onChangedCallback != null) {
              onChangedCallback!(text);
            }
          },
          onSaved: onSavedCallback,
          keyboardType: TextInputType.phone,
          textInputAction: textInputAction,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          maxLines: 1,
          style: AppStyle.fieldStyle(context),
          cursorColor: AppColor.ash,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyle.hintStyle(context),
            suffixText: suffixText,
            suffixStyle: AppStyle.subtitleStyle(context),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.h,
                color: AppColor.borderAsh,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.h,
                color: AppColor.borderAsh,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.h,
                color: AppColor.borderAsh,
              ),
            ),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
