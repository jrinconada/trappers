import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trappers/models/trapper.dart';

class TrapperDetail extends StatelessWidget {
  final Trapper _trapper;

  TrapperDetail(this._trapper);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('🤟🤟🤟'), centerTitle: true),
        body: Hero(
          tag: _trapper,
          child: Material(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: _trapper.pic,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
              Text(_trapper.name, style: TextStyle(fontSize: 40)),
              Text(
                _trapper.genre,
                style: TextStyle(color: Colors.blueGrey, fontSize: 25),
              ),
              Spacer()
            ],
          )),
        ));
  }
}
