import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/screens/trapper_detail.dart';
import 'package:trappers/views/trapper_item.dart';

class TrapperList extends StatelessWidget {
  _toDetail(BuildContext context, Trapper trapper) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TrapperDetail(trapper)));
  }

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
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => _toDetail(context, trappers[index]),
                          child: TrapperItem(trappers[index]),
                        ))));
  }
}
