import 'package:balanced_meal/data/repos/order_repo.dart';
import 'package:balanced_meal/modules/models/order_state.dart';
import 'package:balanced_meal/modules/notifiers/order_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>((ref) {
  final orderRepo = ref.watch(orderRepoProvider);
  return OrderNotifier(orderRepo);
});

final orderLoadingProvider = Provider<bool>((ref) {
  return ref.watch(orderProvider.select((value) => value.response.isLoading));
});
