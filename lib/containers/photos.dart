import 'package:flutter/material.dart';
import 'package:flutter_app/containers/information.dart';
import 'package:flutter_app/models/photos.dart';

import 'package:flutter_app/components/list-item.dart';

class NavArguments {
  final int albumId;

  NavArguments({ this.albumId });
}

class PhotosState extends State<Photos> {
  final int albumId;
  bool loading = true;

  PhotosState({ @required this.albumId });

  List<PhotoModel> _photos = List<PhotoModel>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      PhotoModel.getPhotosByAlbumId(albumId)
        .then((photos) {
          setState(() {
            _photos = photos;
            loading = false;
          });
        });
    });
  }

  void navigateToInformation(context, PhotoModel photo) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (_, __, ___) => Information(photo: photo,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photos'),),
      body: Container(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            loading ? Text('Loading...') : Text('Not loading'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(
                      title: _photos[index].title,
                      description: _photos[index].url,
                      imageUri: _photos[index].url,
                      onPressed: () {
                        navigateToInformation(context, _photos[index]);
                      },
                    );
                  }
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class Photos extends StatefulWidget {
  final int albumId;

  Photos({Key key, this.albumId }): super (key: key);

  @override
  PhotosState createState() => PhotosState(albumId: albumId);
}