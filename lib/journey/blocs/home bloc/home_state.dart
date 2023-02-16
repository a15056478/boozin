part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeStateLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeStateLoaded extends HomeState {
  final int steps;
  final double calories;

  HomeStateLoaded({required this.steps, required this.calories});
  @override
  List<Object?> get props => [steps, calories];
}

class HomeStateError extends HomeState {
  final String error;

  HomeStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
