import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            48.height,
            Text(
              Strings.appName,
              style: abhayaLibreStyle(
                fontSize: 48,
                color: AppColor.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            Spacer(),
            Text(
              Strings.appDescription,
              textAlign: TextAlign.center,
              style: poppinsStyle(
                fontSize: 20,
                color: AppColor.textAsh,
                fontWeight: FontWeight.w300,
              ),
            ),
            30.height,
            WideButton(
              text: Strings.orderFood,
              onPressed: () {
                Navigation.gotoNamed(context, route);
              },
            ),
            43.height,
          ],
        ),
      ),
    );
  }
}
