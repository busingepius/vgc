import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgc/bloc/bloc.dart';
import 'package:vgc/widgets/widget.dart';

class MockDataBloc extends Mock implements DataBloc {}

class MockStorageBloc extends Mock implements StorageBloc {}

void main() {
  late MockDataBloc mockDataBloc;
  late MockStorageBloc mockStorageBloc;

  setUp(() {
    mockDataBloc = MockDataBloc();
    mockStorageBloc = MockStorageBloc();

    when(() => mockDataBloc.close()).thenAnswer((_) async {});
    when(() => mockStorageBloc.close()).thenAnswer((_) async {});
  });

  
  testWidgets('test display of widget',
      (WidgetTester tester) async {
    when(() => mockDataBloc.state).thenReturn({"file": null});
    when(() => mockDataBloc.stream)
        .thenAnswer((_) => Stream.value({"file": null}));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<DataBloc>(
          create: (_) => mockDataBloc,
          child: BlocProvider<StorageBloc>(
            create: (_) => mockStorageBloc,
            child: const CustomPageView(),
          ),
        ),
      ),
    );

    expect(find.text("No image to show"), findsOneWidget);
  });
}
