part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SetSoundModeEvent extends HomeEvent {
  final bool mode;

  const SetSoundModeEvent({required this.mode});

  @override
  List<Object?> get props => [mode];
}

class GetSoundModeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
