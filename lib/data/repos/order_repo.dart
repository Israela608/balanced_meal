import 'package:balanced_meal/data/constants/api_constants.dart';
import 'package:balanced_meal/data/models/order.dart';
import 'package:balanced_meal/data/services/api_client.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderRepoProvider = Provider<OrderRepo>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return OrderRepo(apiClient: apiClient);
});

class OrderRepo {
  OrderRepo({required this.apiClient});

  ApiClient apiClient;

  //final dbHelper = DatabaseHelper();

  Future<dynamic> sendOrders(List<Order> orders) async {
    return await apiClient.postData(
      ApiConstants.orderUrI,
      body: {
        'items': Order.fromListJson(orders),
      },
    );
  }
}
