import 'dart:developer';

import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/modules/providers/food_provider.dart';
import 'package:balanced_meal/modules/providers/food_uploader_provider.dart';
import 'package:balanced_meal/modules/screens/enter_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingScreen extends HookConsumerWidget {
  const OnboardingScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    initData() async {
      await ref.read(foodUploaderProvider.notifier).uploadData(context);

      final isSuccess =
          ref.read(foodUploaderProvider.select((value) => value.isSuccess));

      if (isSuccess) {
        log('Foods uploaded successfully...');
      } else {
        log('Unable to upload foods!');
      }
      await ref.read(foodProvider.notifier).getAllFoods();
    }

    useEffect(() {
      Future.microtask(() {
        return initData();
        //ref.read(foodProvider.notifier).getAllFoodsFromLocalDB(context);
      });

      return null;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: -105.25.w,
            //right: -105.25.w,
            child: Image.asset(
              'assets/images/onboarding.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.7), // Fully opaque black
                  Colors.black
                      .withValues(alpha: 0.0), // Fully transparent black
                ],
              ),
            ),
          ),
          Padding(
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
                    Navigation.gotoNamed(
                      context,
                      EnterDetailsScreen.route,
                    );
                  },
                ),
                43.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
