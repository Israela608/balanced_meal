import 'package:balanced_meal/data/constants/strings.dart';
import 'package:balanced_meal/data/models/response.dart';
import 'package:equatable/equatable.dart';

class InfoState extends Equatable {
  final Response response;
  final bool isCompleted;

  final bool isWeightValidated;
  final bool isHeightValidated;
  final bool isAgeValidated;

  final String gender;
  final double weight;
  final double height;
  final int age;

  const InfoState({
    this.response = const Response.initial(),
    this.isCompleted = false,
    this.isWeightValidated = false,
    this.isHeightValidated = false,
    this.isAgeValidated = false,
    this.gender = '',
    this.weight = 0.0,
    this.height = 0.0,
    this.age = 0,
  });

  double get calories => gender == Strings.genders[1]
      ? (655.1 + (9.56 * weight) + (1.85 * height) - (4.67 * age)) // Female
      : (666.47 + (13.75 * weight) + (5 * height) - (6.75 * age)); // Male

  InfoState copyWith({
    Response? response,
    bool? isCompleted,
    bool? isWeightValidated,
    bool? isHeightValidated,
    bool? isAgeValidated,
    String? gender,
    double? weight,
    double? height,
    int? age,
  }) {
    return InfoState(
      response: response ?? this.response,
      isCompleted: isCompleted ?? this.isCompleted,
      isWeightValidated: isWeightValidated ?? this.isWeightValidated,
      isHeightValidated: isHeightValidated ?? this.isHeightValidated,
      isAgeValidated: isAgeValidated ?? this.isAgeValidated,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
    );
  }

  @override
  List<Object> get props => [
        response,
        isCompleted,
        isWeightValidated,
        isHeightValidated,
        isAgeValidated,
        gender,
        weight,
        height,
        age,
      ];
}
