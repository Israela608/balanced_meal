import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownField extends HookWidget {
  const DropDownField({
    super.key,
    this.labelText = '',
    required this.hintText,
    required this.values,
    required this.selectedValue,
    required this.onSelectValue,
  });

  final String labelText;
  final String hintText;
  final List<String> values;
  final String? selectedValue;
  final ValueChanged<String?> onSelectValue;

  @override
  Widget build(BuildContext context) {
    final isDropdownOpen = useState<bool>(false);

    return GestureDetector(
      onTap: () {
        isDropdownOpen.value = !isDropdownOpen.value;
      },
      child: Column(
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
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                width: 1.h,
                color: AppColor.borderAsh,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                4.width,
                Expanded(
                  child: Text(
                    selectedValue ?? hintText,
                    style: selectedValue != null
                        ? AppStyle.fieldStyle(context)
                        : AppStyle.hintStyle(context),
                  ),
                ),
                10.width,
                AnimatedRotation(
                  turns: isDropdownOpen.value ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: EdgeInsets.all(8.h),
                    child: getSvg(
                      svg: 'chevron-down',
                      height: 20,
                      width: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isDropdownOpen.value)
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 6.w,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: values.map((value) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          onSelectValue(value);
                          isDropdownOpen.value = false;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            color: selectedValue == value
                                ? AppColor.secondary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Row(
                            children: [
                              Text(
                                value,
                                style: AppStyle.bodyStyle(context),
                              ),
                              8.width,
                              if (selectedValue == value)
                                getSvg(
                                  svg: 'tick',
                                  height: 20,
                                  width: 20,
                                ),
                              4.width
                            ],
                          ),
                        ),
                      ),
                      if (value != values.last) 2.height,
                    ],
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
