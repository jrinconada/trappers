import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trappers/models/network_error.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/screens/trapper_list.dart';
import 'package:trappers/services/trapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Trapi trapi = Trapi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trap App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureProvider<Either<Failure, List<Trapper>>>(
        create: (context) => trapi.getTrappers(),
        // catchError: (context, error) {
        //   print(error.toString());
        //   return null;
        // },
        child: TrapperList(),
      ),
    );
  }
}
