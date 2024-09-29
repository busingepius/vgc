import 'package:vgc/api/splash.dart';
import 'package:vgc/bloc/data/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../errors/errors.dart';

class DataBloc extends Bloc<DataEvent, Map> {
  DataBloc() : super({}) {
    on((event, emit) async {
      if (event is SplashEvent) {
        try {
          var data = await getRandomPicture();
          emit(data);
        }on CustomError catch (e) {
          emit({"message": "${e.getError()}. Please try again"});
        }
      }
    });
  }
}
