

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trappers/models/trapper.dart';

class TrapperItem extends StatelessWidget {
  final Trapper _trapper;

  TrapperItem(this._trapper);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: _trapper,
        child: Material(
            child: ListTile(
          leading: CachedNetworkImage(
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            imageUrl: _trapper.pic,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          title: Text(_trapper.name),
          subtitle: Text(_trapper.genre),
        )));
  }
}
