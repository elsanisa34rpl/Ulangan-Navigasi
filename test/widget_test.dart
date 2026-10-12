// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ulangan/main.dart';

void main() {
  testWidgets('Login page shows welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const TechExpressApp());

    expect(find.text('Selamat Datang di Tech Express'), findsOneWidget);
    expect(find.text('Masuk ke Aplikasi'), findsOneWidget);
  });

  testWidgets('Catalog shows multiple gadgets and opens selected detail', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TechExpressApp());
    await tester.tap(find.text('Masuk ke Aplikasi'));
    await tester.pumpAndSettle();
    final catalogScroll = find.descendant(
      of: find.byType(ListView),
      matching: find.byType(Scrollable),
    );

    for (final nama in [
      'Samsung Galaxy A55',
      'iPhone 15',
      'Redmi Note 13',
      'MacBook Air',
    ]) {
      await tester.scrollUntilVisible(
        find.text(nama),
        300,
        scrollable: catalogScroll.first,
      );
      expect(find.text(nama), findsOneWidget);
    }

    await tester.scrollUntilVisible(
      find.text('iPhone 15'),
      300,
      scrollable: catalogScroll.first,
    );
    await tester.drag(find.byType(ListView), const Offset(0, 200));
    await tester.pumpAndSettle();
    await tester.tap(find.text('iPhone 15'));
    await tester.pumpAndSettle();

    expect(find.text('Nama: iPhone 15'), findsOneWidget);
    expect(find.text('Harga: Rp12000000'), findsOneWidget);
  });
}
