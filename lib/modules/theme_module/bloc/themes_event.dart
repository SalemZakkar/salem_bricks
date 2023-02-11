part of 'themes_bloc.dart';

abstract class ThemesEvent extends Equatable {
  const ThemesEvent();
}

class SetThemeEvent extends ThemesEvent {
  final int id;

  const SetThemeEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetThemeEvent extends ThemesEvent {
  @override
  List<Object?> get props => [];
}
