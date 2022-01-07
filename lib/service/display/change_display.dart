import 'package:flutter_bloc/flutter_bloc.dart';

enum DisplayState {
  loadingState,
  indexState
}

class ChangeDisplay extends Cubit<DisplayState> {
  ChangeDisplay() : super(DisplayState.loadingState);

  void changeState(DisplayState state) => emit(state);

}