import 'package:balanced_meal/modules/models/info_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoNotifier extends StateNotifier<InfoState> {
  InfoNotifier() : super(InfoState());

  void initialize() => state = InfoState();

  set isWeightValidated(bool isValidated) =>
      state = state.copyWith(isWeightValidated: isValidated);
  set isHeightValidated(bool isValidated) =>
      state = state.copyWith(isHeightValidated: isValidated);
  set isAgeValidated(bool isValidated) =>
      state = state.copyWith(isAgeValidated: isValidated);

  set gender(String gender) {
    state = state.copyWith(gender: gender);
    updateButton();
  }

  set weight(String weightString) =>
      state = state.copyWith(weight: double.tryParse(weightString));
  set height(String heightString) =>
      state = state.copyWith(height: double.tryParse(heightString));
  set age(String ageString) =>
      state = state.copyWith(age: int.tryParse(ageString));

  void updateButton() {
    final isGenderSelected = state.gender.isNotEmpty;

    state = state.copyWith(
      isCompleted: isGenderSelected &&
          state.isWeightValidated &&
          state.isHeightValidated &&
          state.isAgeValidated,
    );
  }
}
