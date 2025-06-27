import 'package:balanced_meal/common/card_section.dart';
import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/calories_price_box.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/category.dart';
import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/modules/providers/food_provider.dart';
import 'package:balanced_meal/modules/providers/info_provider.dart';
import 'package:balanced_meal/modules/providers/order_provider.dart';
import 'package:balanced_meal/modules/screens/order_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});
  static const String route = '/create_order';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Strings.createOrder,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  30.height,
                  VegetablesBox(),
                  4.height,
                  MeatBox(),
                  4.height,
                  CarbsBox(),
                  9.height,
                ],
              ),
            ),
          ),
          FooterBox(),
        ],
      ),
    );
  }
}

class VegetablesBox extends ConsumerWidget {
  const VegetablesBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FoodCardSection(
      title: Strings.vegetables,
      items: ref.watch(
        foodProvider.select((value) {
          if (value.data == null) {
            return [];
          }
          final categories = value.data!; // Now we know it's not null

          FoodCategory? foodCategory;

          for (final category in categories) {
            if (category.id == Category.vegetables.name) {
              foodCategory = category;
              break;
            }
          }
          return foodCategory?.items ?? [];
        }),
      ),
      onItemRemovePress: (Item newItem) {
        ref.read(orderProvider.notifier).removeOrder(newItem);
      },
      onItemAddPress: (Item newItem) {
        ref.read(orderProvider.notifier).addToOrders(newItem);
      },
    );
  }
}

class MeatBox extends ConsumerWidget {
  const MeatBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FoodCardSection(
      title: Strings.meat,
      items: ref.watch(
        foodProvider.select((value) {
          if (value.data == null) {
            return [];
          }
          final categories = value.data!; // Now we know it's not null

          FoodCategory? foodCategory;

          for (final category in categories) {
            if (category.id == Category.meats.name) {
              foodCategory = category;
              break;
            }
          }
          return foodCategory?.items ?? [];
        }),
      ),
      onItemRemovePress: (Item newItem) {
        ref.read(orderProvider.notifier).removeOrder(newItem);
      },
      onItemAddPress: (Item newItem) {
        ref.read(orderProvider.notifier).addToOrders(newItem);
      },
    );
  }
}

class CarbsBox extends ConsumerWidget {
  const CarbsBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FoodCardSection(
      title: Strings.carbs,
      items: ref.watch(
        foodProvider.select((value) {
          if (value.data == null) {
            return [];
          }
          final categories = value.data!; // Now we know it's not null

          FoodCategory? foodCategory;

          for (final category in categories) {
            if (category.id == Category.carbs.name) {
              foodCategory = category;
              break;
            }
          }
          return foodCategory?.items ?? [];
        }),
      ),
      onItemRemovePress: (Item newItem) {
        ref.read(orderProvider.notifier).removeOrder(newItem);
      },
      onItemAddPress: (Item newItem) {
        ref.read(orderProvider.notifier).addToOrders(newItem);
      },
    );
  }
}

class FooterBox extends ConsumerWidget {
  const FooterBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double userCalories =
        ref.watch(infoNotifierProvider.select((value) => value.calories));

    final bool isOrderAvailable =
        ref.watch(orderProvider.select((value) => value.orderItems.isNotEmpty));
    final bool isOrderWithinRange = ref.watch(orderProvider
        .select((value) => value.isCaloriesWithinRange(userCalories)));

    final bool isButtonEnabled = isOrderAvailable && isOrderWithinRange;

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
          CaloriesPriceBox(),
          10.height,
          WideButton(
            text: Strings.placeOrder,
            isEnabled: isButtonEnabled,
            onPressed: () {
              Navigation.gotoNamed(context, OrderSummaryScreen.route);
            },
          ),
          24.height,
        ],
      ),
    );
  }
}
