import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trappers/models/trapper.dart';

class TrapperList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Trapper> trappers = Provider.of<List<Trapper>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Trappers'),
        ),
        body: trappers == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: trappers.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(trappers[index].name),
                  subtitle: Text(trappers[index].genre),
                ),
              ));
  }
}
