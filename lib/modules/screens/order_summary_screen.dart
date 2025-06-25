import 'package:balanced_meal/common/card_section.dart';
import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/title_value_box.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});
  static const String route = '/order_summary';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Strings.createOrder,
      child: Column(
        children: [
          18.height,
          OrderList(),
          FooterBox(),
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = [
      Order(
        name: 'Bell Pepper',
        totalPrice: 12,
        quantity: 2,
      ),
      Order(
        name: 'Lean Beef',
        totalPrice: 19,
        quantity: 1,
      ),
      Order(
        name: 'Sweet Corn',
        totalPrice: 25,
        quantity: 9,
      ),
    ];

    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderTile(
          order: orders[index],
          onRemovePress: () {
            //onItemPress(items[index]);
          },
          onAddPress: () {
            ///
          },
        );
      },
    );
  }
}

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.order,
    required this.onRemovePress,
    required this.onAddPress,
  });

  final Order order;
  final VoidCallback onRemovePress;
  final VoidCallback onAddPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      margin: EdgeInsets.only(bottom: 12.h),
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
      child: Row(
        children: [
          Container(
            width: 76.w,
            height: 62.h,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(6.r),
              image: DecorationImage(
                //image: NetworkImage(order.imageUrl ?? ''),
                image: NetworkImage(
                    "https://m.media-amazon.com/images/I/41F62-VbHSL._AC_UF1000,1000_QL80_.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.width,
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      order.name ?? '',
                      style: AppStyle.bodyStyle(context)
                          ?.copyWith(color: AppColor.textDark),
                    ),
                  ),
                  Text(
                    '\$${order.totalPrice}',
                    style: AppStyle.bodyStyle(context)?.copyWith(
                      color: AppColor.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              8.height,
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

class FooterBox extends StatelessWidget {
  const FooterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        /* boxShadow: [
          BoxShadow(
            offset: Offset(0, -9.h),
            color: AppColor.appBarShadow,
          )
        ],*/
      ),
      child: Column(
        children: [
          16.height,
          CaloriesPriceBox(
            calories: '1198',
            price: '125',
          ),
          10.height,
          WideButton(
            text: Strings.confirm,
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
