part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class GameModeEvent extends GameEvent {
  final bool? started;
  const GameModeEvent({required this.started});
  @override
  List<Object?> get props => [started];
}

class GetTimes extends GameEvent {
  @override
  List<Object?> get props => [];
}
