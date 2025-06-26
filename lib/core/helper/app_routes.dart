import 'package:balanced_meal/modules/screens/create_order_screen.dart';
import 'package:balanced_meal/modules/screens/enter_details_screen.dart';
import 'package:balanced_meal/modules/screens/onboarding_screen.dart';
import 'package:balanced_meal/modules/screens/order_summary_screen.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        OnboardingScreen.route: (context) => const OnboardingScreen(),
        EnterDetailsScreen.route: (context) => const EnterDetailsScreen(),
        CreateOrderScreen.route: (context) => const CreateOrderScreen(),
        OrderSummaryScreen.route: (context) => const OrderSummaryScreen(),
      };
}
