import 'package:balanced_meal/common/custom_app_bar.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    this.isTextScale = false,
    this.onBackPress,
    required this.child,
  });

  final String title;
  final bool isTextScale;
  final VoidCallback? onBackPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: title,
                onBackPress: onBackPress ?? () => Navigator.pop(context),
              ),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
