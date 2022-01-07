

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Cubit<String> {
  SearchBloc() : super("");

  void search(String data) => emit(data);
}