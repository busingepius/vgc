
// TODO: This works
  // testWidgets('displays "No image to show" when no file is provided',
  //     (WidgetTester tester) async {
  //   // Arrange
  //   when(() => mockDataBloc.state).thenReturn({"file": null});
  //   when(() => mockDataBloc.stream)
  //       .thenAnswer((_) => Stream.value({"file": null}));

  //   // Act
  //   await tester.pumpWidget(
  //     MaterialApp(
  //       home: BlocProvider<DataBloc>(
  //         create: (_) => mockDataBloc,
  //         child: BlocProvider<StorageBloc>(
  //           create: (_) => mockStorageBloc,
  //           child: const CustomPageView(),
  //         ),
  //       ),
  //     ),
  //   );

  //   // Assert
  //   expect(find.text("No image to show"), findsOneWidget);
  // });
  // TODO: End here