part of 'game_bloc.dart';

class GameState extends Equatable {
  const GameState({this.started, this.easy, this.hard, this.mid});
  final bool? started;
  final int? mid, hard, easy;
  @override
  List<Object?> get props => [started, mid, easy, hard];
}

class GameInitial extends GameState {
  @override
  List<Object> get props => [];
}
