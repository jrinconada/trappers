import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/screens/trapper_list.dart';
import 'package:trappers/services/http_trapi.dart';

import 'package:trappers/services/trapi.dart';

import 'mock_trapi.dart';

Widget makeTestable({Widget child, Trapi trapi}) {
  return MaterialApp(
    title: 'Trap App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: FutureProvider<Either<Failure, List<Trapper>>>(
      create: (context) => trapi.getTrappers(),
      child: child,
    ),
  );
}

void main() {
  group('Trapper List', () {
    MockTrapi mockTrapi;
    Trapi httpTrapi;
    setUpAll(() {
      httpTrapi = HttpTrapi();
      mockTrapi = MockTrapi();
    });

    testWidgets('All trappers information is displayed in a list',
        (WidgetTester tester) async {
      // Prepare fake data
      mockTrapi.delay = true;
      List<Trapper> trappers = mockTrapi.prepareTrappers();

      // Build the screen and call API
      await tester.pumpWidget(makeTestable(child: TrapperList(), trapi: mockTrapi));
      await tester.pumpAndSettle(); // Wait for it load

      // Find information on the screen
      for (var trapper in trappers) {
        expect(find.text(trapper.name), findsOneWidget);
        expect(find.text(trapper.genre), findsOneWidget);
      }
    });

    testWidgets('On network failure an error is displayed',
        (WidgetTester tester) async {
      // Prepare fake API      
      mockTrapi.delay = true;
      mockTrapi.error = true;

      // Build the screen and call API
      await tester.pumpWidget(makeTestable(child: TrapperList(), trapi: mockTrapi));
      await tester.pumpAndSettle(); // Wait for it load

      // Find information on the screen
      expect(find.text('Network error'), findsOneWidget);
    });
  });
}
