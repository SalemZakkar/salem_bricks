part of 'shared_bloc.dart';

abstract class SharedEvent extends Equatable {
  const SharedEvent();
}

class RefreshThemeEvent extends SharedEvent {
  @override
  List<Object?> get props => [];
}
