import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgc/widgets/widget.dart';

void main() {
  testWidgets('showCustomSnackBar displays SnackBar with correct message',
      (WidgetTester tester) async {
    // Build the test app with Scaffold to provide the context for the SnackBar
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  showCustomSnackBar(
                      context: context, message: 'Test SnackBar');
                },
                child: const Text('Show SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    // Tap the button to trigger the SnackBar
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // Trigger a frame to show the SnackBar

    // Verify the SnackBar is shown with the correct message
    expect(find.text('Test SnackBar'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    // Pump to let the SnackBar complete its show animation
    await tester.pumpAndSettle();
  });
}
