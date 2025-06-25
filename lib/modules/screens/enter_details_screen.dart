import 'package:balanced_meal/common/custom_scaffold.dart';
import 'package:balanced_meal/common/drop_down_field.dart';
import 'package:balanced_meal/common/plain_text_field.dart';
import 'package:balanced_meal/common/wide_button.dart';
import 'package:balanced_meal/core/helper/navigation.dart';
import 'package:balanced_meal/core/utils/app_colors.dart';
import 'package:balanced_meal/core/utils/extensions.dart';
import 'package:balanced_meal/core/utils/validators.dart';
import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/modules/screens/create_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class EnterDetailsScreen extends StatelessWidget {
  const EnterDetailsScreen({super.key});

  static const route = '/enter_details';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return CustomScaffold(
      title: Strings.enterDetails,
      // onBackPress: ,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              31.height,
              GenderBox(),
              24.height,
              WeightBox(),
              24.height,
              HeightBox(),
              24.height,
              AgeBox(),
              169.height,
              NextButton(formKey: formKey),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}

class GenderBox extends HookConsumerWidget {
  const GenderBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*final text = ref
        .watch(patientProfileProvider.select((value) => value.profile.gender));
*/
    ///
    final selectedValue = useState<String?>(null);

    ///
    return DropDownField(
      labelText: Strings.gender,
      hintText: Strings.chooseGender,
      values: Strings.genders,
      //selectedValue: text,
      selectedValue: selectedValue.value,
      onSelectValue: (value) {
        selectedValue.value = value;
        //ref.read(patientProfileProvider.notifier).updateProfile(gender: value);
      },
    );
  }
}

class WeightBox extends HookConsumerWidget {
  const WeightBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    // final signUpNotifier = ref.read(signUpNotifierProvider.notifier);

    return PlainTextField(
      textController: textController,
      labelText: Strings.weight,
      hintText: Strings.chooseWeight,
      suffixText: Strings.kg,
      textInputAction: TextInputAction.next,
      validatorCallback: Validators.validateDouble(
        isValidated: (value) {
          //signUpNotifier.isFirstNameValidated = value;
        },
        //function: signUpNotifier.updateButton,
      ),
      onChangedCallback: (value) {
        // signUpNotifier.firstName = value;
      },
      onSavedCallback: (value) {
        // signUpNotifier.firstName = value ?? '';
      },
    );
  }
}

class HeightBox extends HookConsumerWidget {
  const HeightBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    // final signUpNotifier = ref.read(signUpNotifierProvider.notifier);

    return PlainTextField(
      textController: textController,
      labelText: Strings.height,
      hintText: Strings.enterHeight,
      suffixText: Strings.cm,
      textInputAction: TextInputAction.next,
      validatorCallback: Validators.validateDouble(
        isValidated: (value) {
          //signUpNotifier.isFirstNameValidated = value;
        },
        //function: signUpNotifier.updateButton,
      ),
      onChangedCallback: (value) {
        // signUpNotifier.firstName = value;
      },
      onSavedCallback: (value) {
        // signUpNotifier.firstName = value ?? '';
      },
    );
  }
}

class AgeBox extends HookConsumerWidget {
  const AgeBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    // final signUpNotifier = ref.read(signUpNotifierProvider.notifier);

    return PlainTextField(
      textController: textController,
      labelText: Strings.age,
      hintText: Strings.enterAge,
      textInputAction: TextInputAction.done,
      validatorCallback: Validators.validateInt(
        isValidated: (value) {
          //signUpNotifier.isFirstNameValidated = value;
        },
        //function: signUpNotifier.updateButton,
      ),
      onChangedCallback: (value) {
        // signUpNotifier.firstName = value;
      },
      onSavedCallback: (value) {
        // signUpNotifier.firstName = value ?? '';
      },
    );
  }
}

class NextButton extends HookConsumerWidget {
  const NextButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isCompleted = ref.watch(signUpNotifierProvider).isCompleted;

    return WideButton(
      text: Strings.next,
      //isEnabled: ,
      onPressed: () async {
        Navigation.gotoNamed(
          context,
          CreateOrderScreen.route,
        );

        /* if (formKey.currentState!.validate()) {
          final signUpNotifier = ref.read(signUpNotifierProvider.notifier);
          await signUpNotifier.signUp();

          final response = ref.read(signUpNotifierProvider).response;

          if (response.isSuccess) {
            return Navigation.gotoWidget(
              context,
              replacePreviousScreen: true,
              AllowNotificationsScreen(),
            );
          } else {
            showCustomSnackBar(
              context,
              message: response.message.isNotEmpty
                  ? response.message
                  : Strings.signUpErrorMessage,
            );
          }
        }*/
      },
    );
  }
}
