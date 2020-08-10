import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trappers/models/network_error.dart';
import 'package:trappers/models/trapper.dart';

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
            ? Center(child: CircularProgressIndicator())
            : trappers.fold(
                (failure) => Center(child: Text(failure.message)),
                (trappers) => ListView.builder(
                    itemCount: trappers.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(trappers[index].name),
                          subtitle: Text(trappers[index].genre),
                        ))));
  }
}
