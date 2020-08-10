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
  testWidgets('All trappers information is displayed in a list',
      (WidgetTester tester) async {
    // Prepare fake data
    Trapi trapi = MockTrapi();

    // Build the screen and call API
    await tester.pumpWidget(makeTestable(child: TrapperList(), trapi: trapi));
    await tester.pumpAndSettle(); // Wait for it load    

    // Find information on the screen
    expect(find.text('Rosalia'), findsOneWidget);
  });
}
