import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trappers/models/trapper.dart';

class TrapperItem extends StatelessWidget {
  final Trapper _trapper;

  TrapperItem(this._trapper);

  Widget _downloadImage(url) {
    Image image = Image.network(url);
    final ImageStream stream = image.image.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((info, call) {},
        onError: (dynamic exception, StackTrace stackTrace) {
      print('enter onError start');
      print(exception);
      print(stackTrace);
      print('enter onError end');
    }));
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CachedNetworkImage(
        width: 60,
        height: 60,        
        fit: BoxFit.cover,
        imageUrl: _trapper.pic,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      // leading: Image.network(_trapper.pic),
      // leading: _downloadImage(_trapper.pic),
      title: Text(_trapper.name),
      subtitle: Text(_trapper.genre),
    );
  }
}
