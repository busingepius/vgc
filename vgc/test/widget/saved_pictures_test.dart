
import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgc/bloc/bloc.dart';
import 'package:vgc/widgets/saved_pictures.dart';

class MockStorageBloc extends Mock implements StorageBloc {}

void main() {
  late MockStorageBloc mockStorageBloc;

  setUp(() {
    mockStorageBloc = MockStorageBloc();
    when(() => mockStorageBloc.close())
        .thenAnswer((_) async {});
  });

  testWidgets('test display of widget',
      (WidgetTester tester) async {
    when(() => mockStorageBloc.state).thenReturn({"files": null});
    when(() => mockStorageBloc.stream)
        .thenAnswer((_) => Stream.value({"files": null}));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<StorageBloc>(
          create: (_) => mockStorageBloc,
          child: const SavedPictures(),
        ),
      ),
    );

    expect(find.text("No saved pictures"), findsOneWidget);
  });

  testWidgets('test grid view available',
      (WidgetTester tester) async {
    var testFilePath = "test/path/image.jpg";
    when(() => mockStorageBloc.state).thenReturn({
      "files": [
        {"filePath": testFilePath},
        {"filePath": testFilePath},
      ]
    });
    when(() => mockStorageBloc.stream).thenAnswer((_) => Stream.value({
          "files": [
            {"filePath": testFilePath},
            {"filePath": testFilePath},
          ]
        })); 

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<StorageBloc>(
          create: (_) => mockStorageBloc,
          child: const SavedPictures(),
        ),
      ),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
  });
}
