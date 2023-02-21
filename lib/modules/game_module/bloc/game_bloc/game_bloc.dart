import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GameModeEvent>(_gameMode);
  }
  _gameMode(GameModeEvent event, Emitter<GameState> emit) {
    emit(GameState(started: event.started));
  }
}
