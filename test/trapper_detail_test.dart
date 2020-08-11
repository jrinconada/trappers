import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/screens/trapper_detail.dart';

Widget makeTestable({Widget child}) {
  return MaterialApp(
    home: child,
  );
}

Trapper prepareTrapper() {
  var info = {
    "name": "Post Malone",
    "genre": "Pop Trap",
    "pic":
        "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2018/07/11/15313304669358.jpg"
  };
  return Trapper.fromJson(info);
}

void main() {
  testWidgets('All trapper information is displayed',
      (WidgetTester tester) async {
        // Prepare for testing
    Trapper trapper = prepareTrapper(); // Fake data
    await tester.pumpWidget(makeTestable(child: TrapperDetail(trapper)));    

    // Find name and genre
    expect(find.text(trapper.name), findsOneWidget);
    expect(find.text(trapper.genre), findsOneWidget);
  });
}
