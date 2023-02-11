import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_brick/modules/theme_module/storage/theme_storage.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc() : super(ThemesInitial()) {
    on<ThemesEvent>((event, emit) {});
    on<SetThemeEvent>(_setTheme);
    on<GetThemeEvent>(_getTheme);
  }

  _setTheme(SetThemeEvent event, Emitter<ThemesState> emit) async {
    await ThemeStorage.setTheme(event.id);
    emit(ThemesState(id: event.id));
  }

  _getTheme(GetThemeEvent event, Emitter<ThemesState> emit) async {
    int id = await ThemeStorage.getTheme();
    emit(ThemesState(id: id));
  }
}
