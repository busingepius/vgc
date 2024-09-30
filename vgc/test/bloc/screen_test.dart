import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgc/bloc/screen/data.dart';
import 'package:vgc/bloc/screen/event.dart';

void main() {
  group(ScreenBloc, () {
    late ScreenBloc screenBloc;

    setUp(() {
      screenBloc = ScreenBloc();
    });

    test('initial state is 0', () {
      expect(screenBloc.state, equals(0));
    });

    blocTest(
      'Result when Navigation to loading random picture',
      build: () => screenBloc,
      act: (bloc) => bloc.add(const Zero()),
      expect: () => [0],
    );

    blocTest(
      'Result when Navigation to saved',
      build: () => screenBloc,
      act: (bloc) => bloc.add(const One()),
      expect: () => [1],
    );
  });
}
