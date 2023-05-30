import 'package:flutter_test/flutter_test.dart';
import 'package:ngl_assessment/main.dart';
import 'package:ngl_assessment/ship_facts/injection.dart' as ship_facts;
import 'package:ngl_assessment/ship_facts/test_keys.dart';

void main() {
  testWidgets('Load Ship Facts Navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    //make sure to init feature
    ship_facts.init();

    //verify we show all available ships
    expect(find.text('SKY'), findsOneWidget);
    expect(find.text('BLISS'), findsOneWidget);
    expect(find.text('ESCAPE'), findsOneWidget);

    // Tap the 'list' icon to trigger navigation.
    await tester.tap(find.text('SKY'));
    await tester.pumpAndSettle();

    // Verify that our screen has loaded. (this does not account for http response)
    expect(find.byKey(TestKeys.keyShipFactsScreen), findsOneWidget);
  });
}
