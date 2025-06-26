import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/order.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:balanced_meal/data/repos/order_repo.dart';
import 'package:balanced_meal/modules/models/info_state.dart';
import 'package:balanced_meal/modules/models/order_state.dart';
import 'package:balanced_meal/modules/notifiers/info_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier(this.orderRepo) : super(OrderState()) {
    // fetchOrder();
  }

  OrderRepo orderRepo;

  Future<void> sendOrder() async {
    state = state.setLoading(Strings.sendingOrder);

    try {
      final response = await orderRepo.sendOrders(state.orderItems);

      // Update the state with new appointments
      state = state.copyWith(
        response: Response.success(Strings.ordersSent),
      );
    } catch (e) {
      state = state.copyWith(response: Response.error(e.toString()));
    }
  }
}
