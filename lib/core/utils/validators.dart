import 'package:balanced_meal/data/constants/strings.dart';
import 'package:flutter/widgets.dart';

typedef ValidateFunction = String? Function(String? value);

/// A form validator handler class
class Validators {
  /// Validates users input to alphabets
  static String? Function(String?)? validateAlpha({
    String? error,
    ValueChanged<bool>? isValidated,
    Function? function,
  }) {
    return (String? value) {
      isValidated != null ? Future.microtask(() => isValidated(false)) : null;

      if (value == null || value.isEmpty) {
        return error ?? Strings.fieldRequired;
      }
      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
      if (!nameExp.hasMatch(value)) {
        return error ?? Strings.onlyAlphabetAllowed;
      }

      Future.microtask(() {
        isValidated != null ? isValidated(true) : null;
        function?.call();
      });

      return null;
    };
  }

  /// Validates users input to double
  static String? Function(String?)? validateDouble({
    String? error,
    ValueChanged<bool>? isValidated,
    Function? function,
  }) {
    return (String? value) {
      isValidated != null ? Future.microtask(() => isValidated(false)) : null;

      if (value == null || value.isEmpty) {
        return error ?? 'Field is required.';
      }
      if ((double.tryParse(value) ?? 0.0) <= 0.0) {
        return error ?? 'Not a valid number.';
      }

      Future.microtask(() {
        isValidated != null ? isValidated(true) : null;
        function?.call();
      });

      return null;
    };
  }

  /// Validates users input to int
  ///   /// Validates users input to int
  static String? Function(String?)? validateInt({
    String? error,
    ValueChanged<bool>? isValidated,
    Function? function,
  }) {
    return (String? value) {
      isValidated != null ? Future.microtask(() => isValidated(false)) : null;

      if (value == null || value.isEmpty) {
        return error ?? 'Field is required.';
      }
      if ((int.tryParse(value) ?? 0) <= 0) {
        return error ?? 'Not a valid number.';
      }

      Future.microtask(() {
        isValidated != null ? isValidated(true) : null;
        function?.call();
      });

      return null;
    };
  }
}
