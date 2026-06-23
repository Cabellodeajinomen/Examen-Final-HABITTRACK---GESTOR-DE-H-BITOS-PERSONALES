import 'package:flutter_test/flutter_test.dart';
import 'package:habittrack/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HabitTrackApp());

    // Verify that the login screen is shown.
    expect(find.text('Login Screen'), findsOneWidget);
  });
}
