import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_project/pages/screens/about_app_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/pages/screens/welcome_page.dart';

Widget widgetTest1() {
  return const MaterialApp(
    home: AboutAppPage(),
  );
}

Widget widgetTest2() {
  return const MaterialApp(
    home: WelcomePage(),
  );
}

void main() {
  group("Home Screen Widget Test", () {
    testWidgets("Judul About App", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest1());
      expect(find.text("About - Jobfinders"), findsOneWidget);
    });
    
    testWidgets("Terdapat Widget AppBar", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest1());
      expect(find.byType(AppBar), findsOneWidget);
    });
    testWidgets("Terdapat Widget SingleChildScrollView", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest1());
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
    testWidgets("Terdapat Widget Scaffold", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest2());
      expect(find.byType(Scaffold), findsOneWidget);
    });
    testWidgets("Terdapat Widget Lottie", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest2());
      expect(find.byType(Lottie), findsOneWidget);
    });
    testWidgets("Terdapat Widget Column", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest2());
      expect(find.byType(Column), findsOneWidget);
    });
    testWidgets("Terdapat Widget Container", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest2());
      expect(find.byType(Container), findsOneWidget);
    });
    testWidgets("Terdapat Widget ElevatedButton", (widgetTester) async {
      await widgetTester.pumpWidget(widgetTest2());
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
