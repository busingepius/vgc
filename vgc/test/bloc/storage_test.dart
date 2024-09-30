import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgc/bloc/storage/data.dart';
import 'package:vgc/bloc/storage/event.dart';

void main() {
  group(StorageBloc, () {
    late StorageBloc storageBloc;

    setUp(() {
      storageBloc = StorageBloc();
    });

    test('initial state is {}', () {
      expect(storageBloc.state, equals({}));
    });

    blocTest(
      'Result when writing file to application storage',
      build: () => storageBloc,
      act: (bloc) => bloc.add(const WriteEvent("")),
      expect: () => [
        // TODO: find the result of these functions
        predicate((state) {
          if (state is Map && state.containsKey('file') ||
              state is Map && state.containsKey('message')) {
            return true;
          }
          return false;
        }),
      ],
    );

    blocTest(
      'Result when reading file to application storage',
      build: () => storageBloc,
      act: (bloc) => bloc.add(const ReadEvent()),
      expect: () => [
        predicate((state) {
          // TODO: find the result of these functions
          if (state is Map && state.containsKey('file') ||
              state is Map && state.containsKey('message')) {
            return true;
          }
          return false;
        }),
      ],
    );
  });
}
