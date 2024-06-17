import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_movies/pages/home_tabs.dart';

void main() {
  group('HomeTabs', () {
    testWidgets('renderização da home tabs', (WidgetTester tester) async {

      await tester.pumpWidget(const MaterialApp(home: HomeTabs()));

      expect(find.byType(HomeTabs), findsOneWidget);

      expect(find.byType(TabBarView), findsOneWidget);

      expect(find.byType(BottomNavigationBar), findsOneWidget);

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('Books'), findsOneWidget);
      expect(find.byIcon(Iconsax.home), findsOneWidget);
      expect(find.byIcon(Iconsax.ticket), findsOneWidget);
      expect(find.byIcon(Iconsax.book_1), findsOneWidget);
    });
  });
}
