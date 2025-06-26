import 'package:balanced_meal/common/loading_stack.dart';
import 'package:balanced_meal/common/show_custom_snackbar.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/data/models/food_category.dart';
import 'package:balanced_meal/modules/providers/food_provider.dart';
import 'package:balanced_meal/modules/providers/food_uploader_provider.dart';
import 'package:balanced_meal/modules/providers/order_provider.dart';
import 'package:balanced_meal/modules/screens/onboarding_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:balanced_meal/common/card_section.dart';
import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/calories_price_box.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/info_provider.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key});
  static const String route = '/order_summary';

  @override
  Widget build(BuildContext context) {
    return LoadingStack(
      loadingProvider: orderLoadingProvider,
      child: CustomScaffold(
        title: Strings.orderSummary,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    18.height,
                    OrderList(),
                  ],
                ),
              ),
            ),
            FooterBox(),
          ],
        ),
      ),
    );
  }
}

class OrderList extends ConsumerWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Order> orders =
        ref.watch(orderProvider.select((value) => value.orderItems));
    final List<FoodCategory> categories =
        ref.watch(foodProvider.select((value) => value.data ?? []));

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        Item orderItem = Item();

        for (final category in categories) {
          List<Item>? items = category.items;

          if (items != null) {
            for (final item in items) {
              String? foodName = item.foodName;

              if (foodName != null) {
                if (foodName == orders[index].name) {
                  orderItem = item;
                }
              }
            }
          }
        }

        return OrderTile(
          order: orders[index],
          imageUrl: orderItem.imageUrl ?? '',
          onRemovePress: () {
            ref.read(orderProvider.notifier).removeOrder(orderItem);
          },
          onAddPress: () {
            ref.read(orderProvider.notifier).addToOrders(orderItem);
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
    required this.imageUrl,
    required this.onRemovePress,
    required this.onAddPress,
  });

  final Order order;
  final String imageUrl;
  final VoidCallback onRemovePress;
  final VoidCallback onAddPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      margin: EdgeInsets.only(
        bottom: 12.h,
        left: 24.w,
        right: 24.w,
      ),
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
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.width,
          Expanded(
            child: Column(
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
                      child: Center(
                        child: Text(
                          order.quantity.toString(),
                          style: poppinsStyle(
                            color: AppColor.textDark,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
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
      ),
      child: Column(
        children: [
          16.height,
          CaloriesPriceBox(),
          10.height,
          WideButton(
            text: Strings.confirm,
            isEnabled: isButtonEnabled,
            onPressed: () async {
              await ref.read(orderProvider.notifier).sendOrder();

              final response = ref.read(orderProvider);
              if (response.isSuccess) {
                ref.read(infoNotifierProvider.notifier).initialize();
                ref.read(foodUploaderProvider.notifier).initialize();
                //ref.read(foodProvider.notifier).initialize();
                ref.read(orderProvider.notifier).initialize();

                Navigation.goBackUntil(
                  context,
                  OnboardingScreen.route,
                );
              }

              showCustomSnackBar(
                context,
                isError: !response.isSuccess,
                title: response.response.data,
                message: response.response.message,
              );
            },
          ),
          35.height,
        ],
      ),
    );
  }
}
