import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCardSection extends StatelessWidget {
  const FoodCardSection({
    super.key,
    required this.title,
    required this.items,
    required this.onItemPress,
  });

  final String title;
  final List<Item> items;
  final ValueChanged<Item> onItemPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            Strings.vegetables,
            style: AppStyle.titleStyle(context),
          ),
        ),
        15.height,
        Row(
          children: [
            24.width,
            ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FoodCard(
                  item: items[index],
                  onPress: () {
                    onItemPress(items[index]);
                  },
                );
              },
            ),
            12.width,
          ],
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.item,
    required this.onPress,
  });

  final Item item;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(3.w, 4.h),
            blurRadius: 15.5.r,
            color: AppColor.cardShadow,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 163.w,
            height: 108.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                image: NetworkImage(item.imageUrl ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.height,
          Row(
            children: [
              Expanded(
                child: Text(
                  item.foodName ?? '',
                  style: AppStyle.bodyStyle(context)
                      ?.copyWith(color: AppColor.textDark),
                ),
              ),
              Text(
                '${item.calories} ${Strings.cal}',
                style: poppinsStyle(
                  color: AppColor.textAsh,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$12',
                style: AppStyle.bodyStyle(context)?.copyWith(
                  color: AppColor.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: onPress,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.primary,
                  ),
                  child: Text(
                    Strings.add,
                    style: poppinsStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
