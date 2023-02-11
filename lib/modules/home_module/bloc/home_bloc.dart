import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/home_module/storage/home_storage.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<SetSoundModeEvent>(_setSoundMode);
    on<GetSoundModeEvent>(_getSoundMode);
  }

  void _setSoundMode(SetSoundModeEvent event, Emitter<HomeState> emit) async {
    await HomeStorage.setSoundMode(event.mode);
  }

  void _getSoundMode(GetSoundModeEvent event, Emitter<HomeState> emit) async {
    bool mode = await HomeStorage.getSoundMode();
    emit(HomeState(soundMode: mode));
  }
}
