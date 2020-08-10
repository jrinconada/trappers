import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/screens/trapper_list.dart';

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
    MockTrapi trapi;
    setUpAll(() {
      trapi = MockTrapi();
    });

    testWidgets('All trappers information is displayed in a list',
        (WidgetTester tester) async {
      // Prepare fake data
      trapi.delay = true;
      List<Trapper> trappers = trapi.prepareTrappers();

      // Build the screen and call API
      await tester.pumpWidget(makeTestable(child: TrapperList(), trapi: trapi));
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
      trapi.delay = true;
      trapi.error = true;

      // Build the screen and call API
      await tester.pumpWidget(makeTestable(child: TrapperList(), trapi: trapi));
      await tester.pumpAndSettle(); // Wait for it load

      // Find information on the screen
      expect(find.text('Network error'), findsOneWidget);
    });
  });
}
