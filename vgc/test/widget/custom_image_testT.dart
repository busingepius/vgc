
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgc/widgets/widget.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const ImageChunkEvent(
        cumulativeBytesLoaded: 100, expectedTotalBytes: 200));
  });

  testWidgets('displays the image when loaded successfully',
      (WidgetTester tester) async {
    const testImageUrl = 'https://example.com/image.jpg';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomImage(image: testImageUrl),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final networkImageFinder = find.byWidgetPredicate((widget) =>
        widget is Image &&
        widget.image is NetworkImage &&
        (widget.image as NetworkImage).url == testImageUrl);

    expect(networkImageFinder, findsOneWidget);
  });
}
