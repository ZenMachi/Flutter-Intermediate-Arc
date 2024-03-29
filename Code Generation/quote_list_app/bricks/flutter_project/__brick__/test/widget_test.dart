import 'package:flutter_test/flutter_test.dart';

import 'package:{{appName.snakeCase()}}/main.dart';

void main() {
  testWidgets('Find the text on screen',
          (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());


        expect(find.text('This is {{appName.titleCase()}}'), findsOneWidget);
      });
}