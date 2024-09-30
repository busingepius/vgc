import 'package:vgc/api/random.dart';
import 'package:vgc/bloc/data/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


import '../../errors/errors.dart';

class DataBloc extends Bloc<DataEvent, Map> {
  DataBloc() : super({}) {
    on((event, emit) async {
      if (event is SplashEvent) {
        try {
          var client = http.Client();
          var data = await getRandomPicture(client);
          emit(data);
        } on CustomError catch (e) {
          emit({"message": "${e.getError()}. Please try again"});
        }
      }
    });
  }
}
