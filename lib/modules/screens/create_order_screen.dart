import 'package:balanced_meal/common/card_section.dart';
import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/title_value_box.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});
  static const String route = '/create_order';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Strings.createOrder,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                30.height,
                VegetablesBox(),
                24.height,
                MeatBox(),
                24.height,
                CarbsBox(),
                29.height,
              ],
            ),
          ),
          FooterBox(),
        ],
      ),
    );
  }
}

class VegetablesBox extends StatelessWidget {
  const VegetablesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodCardSection(
      title: Strings.vegetables,
      items: items,
      onItemPress: (Item newItem) {
        ///
      },
    );
  }
}

class MeatBox extends StatelessWidget {
  const MeatBox({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodCardSection(
      title: Strings.meat,
      items: items,
      onItemPress: (Item newItem) {
        ///
      },
    );
  }
}

class CarbsBox extends StatelessWidget {
  const CarbsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return FoodCardSection(
      title: Strings.carbs,
      items: items,
      onItemPress: (Item newItem) {
        ///
      },
    );
  }
}

class FooterBox extends StatelessWidget {
  const FooterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -9.h),
            color: AppColor.appBarShadow,
          )
        ],
      ),
      child: Column(
        children: [
          16.height,
          CaloriesPriceBox(
            calories: calories,
            price: price,
          ),
          10.height,
          WideButton(
            text: Strings.placeOrder,
            onPressed: () {
              ///
            },
          ),
          24.height,
        ],
      ),
    );
  }
}
