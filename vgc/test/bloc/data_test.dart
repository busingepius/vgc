import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgc/bloc/bloc.dart';

void main() {
  group(DataBloc, () {
    late DataBloc dataBloc;

    setUp(() {
      dataBloc = DataBloc();
    });

    test('initial state is {}', () {
      expect(dataBloc.state, equals({}));
    });

    blocTest(
      'Result when fetching data from API',
      build: () => dataBloc,
      wait: const Duration(milliseconds: 3000),
      act: (bloc) => bloc.add(const SplashEvent()),
      expect: () => [
        predicate((state) {
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
