import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double _cardHeight = 197.h;
double _cardWidth = 183.h;

class FoodCardSection extends StatelessWidget {
  const FoodCardSection({
    super.key,
    required this.title,
    required this.items,
    required this.onItemAddPress,
    required this.onItemRemovePress,
  });

  final String title;
  final List<Item> items;
  final ValueChanged<Item> onItemAddPress;
  final ValueChanged<Item> onItemRemovePress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            title,
            style: AppStyle.titleStyle(context),
          ),
        ),
        15.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: SizedBox(
            height: _cardHeight,
            child: Row(
              children: [
                24.width,
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return FoodCard(
                      item: items[index],
                      quantity: ,
                      onAddPress: () {
                        onItemAddPress(items[index]);
                      },
                      onRemovePress: () {
                        onItemAddPress(items[index]);
                      },
                    );
                  },
                ),
                12.width,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.item,
    required this.quantity,
    required this.onAddPress,
    required this.onRemovePress,
  });

  final Item item;
  final int quantity;
  final VoidCallback onAddPress;
  final VoidCallback onRemovePress;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: _cardHeight,
        width: _cardWidth,
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
        child: MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: Column(
            children: [
              SizedBox(
                  width: 163.w,
                  height: 108.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl ?? '',
                      fit: BoxFit.cover,
                      //errorWidget: CircularProgressIndicator(),
                    ),
                  )),
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
                  /////////////////////////
                  GestureDetector(
                    onTap: onAddPress,
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
                  //////////////////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '\$12 ${Strings.cal}',
                          style: poppinsStyle(
                            color: AppColor.textAsh,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      circleButton(
                        text: '-',
                        onPress: onRemovePress,
                      ),
                      SizedBox(
                        width: 32.w,
                        child: Text(
                          order.quantity.toString(),
                          style: poppinsStyle(
                            color: AppColor.textDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      circleButton(
                        text: '+',
                        onPress: onAddPress,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circleButton({
    required String text,
    required VoidCallback onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        backgroundColor: AppColor.primary,
        radius: 12.r,
        child: Text(
          text,
          style: poppinsStyle(
            fontSize: 16,
            color: AppColor.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
