import 'package:flutter_test/flutter_test.dart';

import 'package:my_first_app/main.dart';

void main() {
  testWidgets('App renders HomeScreen without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Explorer'), findsOneWidget);
    expect(find.text('Daily Inspiration'), findsOneWidget);
    expect(find.text('Focus Areas'), findsOneWidget);
  });
}
