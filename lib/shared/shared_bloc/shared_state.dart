part of 'shared_bloc.dart';

abstract class SharedState extends Equatable {
  const SharedState();
}

class SharedInitial extends SharedState {
  @override
  List<Object> get props => [];
}

class RefreshThemeState extends SharedState {
  @override
  List<Object?> get props => [];
}
