import 'package:flutter_test/flutter_test.dart';

import 'package:my_first_app/main.dart';

void main() {
  testWidgets('App renders HomeScreen with Start button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Start'), findsOneWidget);
  });
}
