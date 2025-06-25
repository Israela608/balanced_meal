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

    // To get the position and size of the tap target area
    final GlobalKey fieldKey = useMemoized(() => GlobalKey(), []);
    final overlayEntry =
        useRef<OverlayEntry?>(null); // Use useRef for OverlayEntry

    void closeDropdown() {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
      isDropdownOpen.value = false;
    }

    void openDropdown() {
      final RenderBox renderBox =
          fieldKey.currentContext!.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = renderBox.localToGlobal(Offset.zero);

      overlayEntry.value = OverlayEntry(
        builder: (context) => Stack(
          // Use Stack for layering
          children: [
            // Full screen GestureDetector to capture taps outside the dropdown content
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  closeDropdown(); // Close if tapped anywhere on this GestureDetector
                },
                // Make it transparent but still catch taps
                child: Container(color: Colors.transparent),
              ),
            ),
            // Your actual dropdown content
            Positioned(
              left: offset.dx,
              top: offset.dy +
                  size.height -
                  4.h, // Position below the field - small gap
              width: size.width,
              child: Material(
                // Important for theming and elevation
                elevation:
                    0, // Use your own shadow if preferred, or set elevation
                color:
                    Colors.transparent, // Let the child container handle color
                child: Container(
                  //margin: EdgeInsets.only(top: 2.h), // Small gap if needed
                  padding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 6.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      width: 1.h,
                      color: AppColor.borderAsh,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4.h),
                        blurRadius: 6.r,
                        spreadRadius: -2.r,
                        color: AppColor.dropdownShadow,
                      ),
                      BoxShadow(
                        offset: Offset(0, 12.h),
                        blurRadius: 16.r,
                        spreadRadius: -4.r,
                        color: AppColor.dropdownShadow2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: values.map((value) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              onSelectValue(value);
                              closeDropdown();
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
                                    style: AppStyle.fieldStyle(context),
                                  ),
                                  8.width,
                                  Spacer(),
                                  if (selectedValue == value)
                                    getSvg(
                                      svg: 'check',
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
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(overlayEntry.value!);
      isDropdownOpen.value = true;
    }

    useEffect(() {
      // This is the cleanup function that will be called when DropDownField is disposed.
      return () {
        // Ensure overlay is removed if the widget itself is disposed
        // while the dropdown might have been open.
        overlayEntry.value?.remove();
        overlayEntry.value = null; // Clear the reference
      };
    }, const []); // Empty dependency array

    return Column(
      key: fieldKey, // Assign key to the Column that represents the tap target
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize:
          MainAxisSize.min, // Important for Stack if you were to use it here
      children: [
        if (labelText.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              labelText,
              style: AppStyle.subtitleStyle(context),
            ),
          ),
        GestureDetector(
          onTap: () {
            // isDropdownOpen.value = !isDropdownOpen.value;
            if (isDropdownOpen.value) {
              closeDropdown();
            } else {
              openDropdown();
            }
          },
          child: Container(
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
        ),
      ],
    );
  }
}
