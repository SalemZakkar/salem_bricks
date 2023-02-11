part of 'themes_bloc.dart';

class ThemesState extends Equatable {
  final int? id;

  const ThemesState({this.id});

  @override
  List<Object?> get props => [id];
}

class ThemesInitial extends ThemesState {
  @override
  List<Object> get props => [];
}
