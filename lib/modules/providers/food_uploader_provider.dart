import 'package:balanced_meal/data/models/response.dart';
import 'package:balanced_meal/modules/models/info_state.dart';
import 'package:balanced_meal/modules/notifiers/food_upload_notifier.dart';
import 'package:balanced_meal/modules/notifiers/info_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final foodUploaderProvider =
    StateNotifierProvider<FoodUploadNotifier, Response<dynamic>>((ref) {
  return FoodUploadNotifier();
});

/*
final signUpLoadingProvider = Provider<bool>((ref) {
  final signUpState = ref.watch(signUpNotifierProvider);
  return signUpState.response.isLoading;
});
*/
