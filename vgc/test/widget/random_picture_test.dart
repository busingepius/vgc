import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgc/bloc/storage/data.dart';
import 'package:vgc/bloc/data/data.dart';
import 'package:vgc/widgets/widget.dart';

// Mocks for the blocs
class MockDataBloc extends Mock implements DataBloc {}

class MockStorageBloc extends Mock implements StorageBloc {}

void main() {
  late MockDataBloc mockDataBloc;
  late MockStorageBloc mockStorageBloc;

  setUp(() {
    mockDataBloc = MockDataBloc();
    mockStorageBloc = MockStorageBloc();

    // Mocking close methods to avoid errors
    when(() => mockDataBloc.close()).thenAnswer((_) async {});
    when(() => mockStorageBloc.close()).thenAnswer((_) async {});
  });

  
// TODO: This works
  testWidgets('displays "No image to show" when no file is provided',
      (WidgetTester tester) async {
    // Arrange
    when(() => mockDataBloc.state).thenReturn({"file": null});
    when(() => mockDataBloc.stream)
        .thenAnswer((_) => Stream.value({"file": null}));

    // Act
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

    // Assert
    expect(find.text("No image to show"), findsOneWidget);
  });
  // TODO: End here
}
