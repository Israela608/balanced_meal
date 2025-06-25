import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:flutter/material.dart';

class CaloriesPriceBox extends StatelessWidget {
  const CaloriesPriceBox({
    super.key,
    required this.calories,
    required this.price,
  });

  final String calories;
  final String price;

  @override
  Widget build(BuildContext context) {
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
              '$calories ${Strings.calOutOf}',
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
              '\$ $price',
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
