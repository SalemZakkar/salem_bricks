part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({this.soundMode});

  final bool? soundMode;

  @override
  List<Object?> get props => [soundMode];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => throw UnimplementedError();
}
