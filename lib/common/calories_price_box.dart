import 'package:balanced_meal/modules/providers/info_provider.dart';
import 'package:balanced_meal/modules/providers/order_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:flutter/material.dart';

class CaloriesPriceBox extends ConsumerWidget {
  const CaloriesPriceBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderProvider);
    final double userCalories =
        ref.watch(infoNotifierProvider.select((value) => value.calories));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.cal,
              style: AppStyle.bodyStyle(context)
                  ?.copyWith(color: AppColor.textDark),
            ),
            Text(
              '${orderState.totalCalories.toInt()} ${Strings.calOutOf} ${userCalories.toInt()} ${Strings.cal}',
              style: poppinsStyle(
                color: AppColor.textAsh,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.price,
              style: AppStyle.bodyStyle(context)
                  ?.copyWith(color: AppColor.textDark),
            ),
            Text(
              '\$ ${orderState.totalPriceOfAllOrders}',
              style: poppinsStyle(
                color: AppColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
