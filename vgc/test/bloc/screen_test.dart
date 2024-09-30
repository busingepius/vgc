// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
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
