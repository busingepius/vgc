import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/storage.dart';
import '../../errors/errors.dart';
import 'event.dart';

class StorageBloc extends Bloc<StorageEvent, Map> {
  StorageBloc() : super({}) {
    on((event, emit) async {
      if (event is WriteEvent) {
        try {
          await writeData(event.url);
          var data = await readAllFiles();
          emit({"files": data});
        } on CustomError catch (e) {
          emit({"message": "${e.getError()}. Please try again"});
        }
      }

      if (event is ReadEvent) {
        try {
          var data = await readAllFiles();
          emit({"files": data});
        } on CustomError catch (e) {
          emit({"message": "${e.getError()}. Please try again"});
        }
      }
    });
  }
}
