part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeEventInitial extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeEventLoaded extends HomeEvent {
  @override
  List<Object?> get props => [];
}
