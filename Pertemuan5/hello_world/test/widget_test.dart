import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/combined_pertemuan5.dart';

void main() {
  testWidgets('combined app shows generator and supports favorite flow', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 800));

    await tester.pumpWidget(const CombinedPertemuan5App());

    expect(find.text('Like'), findsOneWidget);
    expect(find.text('Next'), findsOneWidget);

    await tester.tap(find.text('Like'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();

    expect(find.textContaining('You have 1 favorites:'), findsOneWidget);
  });

  testWidgets('combined app shows date picker and basic widgets page', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1000, 800));

    await tester.pumpWidget(const CombinedPertemuan5App());

    await tester.tap(find.text('Date Picker'));
    await tester.pumpAndSettle();

    expect(find.text('Pilih Tanggal'), findsOneWidget);

    await tester.tap(find.text('Basic Widgets'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Nama saya Yosep Bima Aprillian, sedang belajar Pemrograman Mobile',
      ),
      findsOneWidget,
    );
    expect(find.text('Total likes FAB: 0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.thumb_up));
    await tester.pumpAndSettle();

    expect(find.text('Total likes FAB: 1'), findsOneWidget);
  });
}
