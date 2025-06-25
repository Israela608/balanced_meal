import 'package:balanced_meal/common/card_section.dart';
import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/title_value_box.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/app_styles.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/item.dart';
import 'package:balanced_meal/modules/screens/order_summary_screen.dart';
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

  static List<Item> items = [
    Item(
      foodName: "Broccoli",
      calories: 55,
      imageUrl:
          "https://cdn.britannica.com/25/78225-050-1781F6B7/broccoli-florets.jpg",
    ),
    Item(
      foodName: "Spinach",
      calories: 23,
      imageUrl:
          "https://www.daysoftheyear.com/cdn-cgi/image/dpr=1%2Cf=auto%2Cfit=cover%2Cheight=650%2Cq=40%2Csharpen=1%2Cwidth=956/wp-content/uploads/fresh-spinach-day.jpg",
    ),
    Item(
      foodName: "Broccoli",
      calories: 55,
      imageUrl:
          "https://cdn11.bigcommerce.com/s-kc25pb94dz/images/stencil/1280x1280/products/271/762/Carrot__40927.1634584458.jpg?c=2",
    ),
    Item(
      foodName: "Bell Pepper",
      calories: 31,
      imageUrl:
          "https://i5.walmartimages.com/asr/5d3ca3f5-69fa-436a-8a73-ac05713d3c2c.7b334b05a184b1eafbda57c08c6b8ccf.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF",
    ),
  ];

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

  static List<Item> items = [
    Item(
      foodName: "Chicken Breast",
      calories: 165,
      imageUrl:
          "https://www.savorynothings.com/wp-content/uploads/2021/02/airy-fryer-chicken-breast-image-8.jpg",
    ),
    Item(
      foodName: "Salmon",
      calories: 206,
      imageUrl:
          "https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/k%2F2023-04-baked-salmon-how-to%2Fbaked-salmon-step6-4792",
    ),
    Item(
      foodName: "Lean Beef",
      calories: 250,
      imageUrl:
          "https://www.mashed.com/img/gallery/the-truth-about-lean-beef/l-intro-1621886574.jpg",
    ),
    Item(
      foodName: "Turkey",
      calories: 135,
      imageUrl:
          "https://fox59.com/wp-content/uploads/sites/21/2022/11/white-meat.jpg?w=2560&h=1440&crop=1",
    ),
  ];

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

  static List<Item> items = [
    Item(
      foodName: "Brown Rice",
      calories: 111,
      imageUrl: "https://assets-jpcust.jwpsrv.com/thumbnails/k98gi2ri-720.jpg",
    ),
    Item(
      foodName: "Oats",
      calories: 389,
      imageUrl:
          "https://media.post.rvohealth.io/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg",
    ),
    Item(
      foodName: "Sweet Corn",
      calories: 86,
      imageUrl:
          "https://m.media-amazon.com/images/I/41F62-VbHSL._AC_UF1000,1000_QL80_.jpg",
    ),
    Item(
      foodName: "Black Beans",
      calories: 132,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwxSM9Ib-aDXTUIATZlRPQ6qABkkJ0sJwDmA&usqp=CAU",
    ),
  ];

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
            calories: '1000',
            price: '125',
          ),
          10.height,
          WideButton(
            text: Strings.placeOrder,
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
