import 'package:balanced_meal/modules/models/info_state.dart';
import 'package:balanced_meal/modules/notifiers/info_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final infoNotifierProvider =
    StateNotifierProvider<InfoNotifier, InfoState>((ref) {
  return InfoNotifier();
});

/*
final signUpLoadingProvider = Provider<bool>((ref) {
  final signUpState = ref.watch(signUpNotifierProvider);
  return signUpState.response.isLoading;
});
*/
