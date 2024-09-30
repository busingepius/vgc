import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgc/bloc/screen/event.dart';

class ScreenBloc extends Bloc<IndexEvent, int> {
  ScreenBloc() : super(0) {
    on((event, emit)  {
      if (event is Zero) {
        emit(0);
      }
      if (event is One) {
        emit(1);
      }
    });
  }
}
