import 'package:equatable/equatable.dart';

class FitnessDataModel extends Equatable {
  final int steps;
  final double calories;

  const FitnessDataModel(this.steps, this.calories);

  @override
  List<Object?> get props => [steps, calories];
}
