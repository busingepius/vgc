import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgc/widgets/widget.dart';

void main() {
  testWidgets('test snackbar showing',
      (WidgetTester tester) async {
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

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); 

    expect(find.text('Test SnackBar'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    await tester.pumpAndSettle();
  });
}
