// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:latihan_basic_widgets/main.dart';

void main() {
  testWidgets('Profile Card App basic test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProfileCardApp());

    // Verify that our profile card shows the initial profile data.
    expect(find.text('Tekno'), findsOneWidget);
    expect(find.text('Profile Card App'), findsOneWidget);
    expect(find.text('Scrolling Engineer'), findsOneWidget);

    // Test that edit button exists
    expect(find.text('Edit Profile'), findsOneWidget);

    // Test theme toggle button exists
    expect(find.byIcon(Icons.brightness_auto), findsOneWidget);
  });

  testWidgets('About page navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProfileCardApp());

    // Find and tap the floating action button (About button)
    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle();

    // Verify that About page is shown
    expect(find.text('Tentang Aplikasi'), findsOneWidget);
    expect(find.text('Profile Card App'), findsAtLeastNWidgets(1));
    expect(find.text('Deskripsi Aplikasi'), findsOneWidget);

    // Test back navigation
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Should be back to main profile page
    expect(find.text('Edit Profile'), findsOneWidget);
  });
}
