import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/views/trapper_item.dart';

class TrapperList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Either<Failure, List<Trapper>> trappers =
        Provider.of<Either<Failure, List<Trapper>>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Trappers'),
        ),
        body: trappers == null
            ? Center(child: CircularProgressIndicator()) // Loading
            : trappers.fold(
                (failure) => Center(child: Text(failure.message)), // Error
                (trappers) => ListView.builder(
                    // Data fetched
                    itemCount: trappers.length,
                    itemBuilder: (context, index) =>
                        TrapperItem(trappers[index]))));
  }
}
