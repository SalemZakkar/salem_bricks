part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState({this.started});
  final bool? started;
  @override
  List<Object?> get props => [started];
}

class GameInitial extends GameState {
  @override
  List<Object> get props => [];
}
