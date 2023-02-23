import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/game_module/persistance/game_store.dart';

import '../../enums/level.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial()) {
    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GameModeEvent>(_gameMode);
    on<GetTimes>(_getTimes);
  }
  _gameMode(GameModeEvent event, Emitter<GameState> emit) {
    emit(GameState(started: event.started));
  }

  _getTimes(GetTimes event, Emitter<GameState> emit) async {
    int easy = await GameStore().get(Level.easy);
    int mid = await GameStore().get(Level.medium);
    int hard = await GameStore().get(Level.hard);
    emit(GameState(easy: easy, mid: mid, hard: hard));
  }
}
