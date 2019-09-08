import 'package:flutter/material.dart';
import 'package:flutter_app/components/button.dart';
import 'package:flutter_app/models/album.dart';

import 'package:flutter_app/components/album-item.dart';

import 'package:flutter_app/constants/routes.dart' as ROUTES;

import 'package:flutter_app/containers/photos.dart';

class AlbumsState extends State<Albums> {
  List<AlbumModel> _albums = List<AlbumModel>();
  bool loading = false;

  void getAlbums() {
    setState(() {
      loading = true;
    });

    AlbumModel
      .getAll
      .then((albums) {
        loading = false;

        setState(() {
          loading = false;
          _albums = albums;
        });
      });
  }

  void navigateToPhotos(context, int albumId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Photos(albumId: albumId,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Button(
              onPressed: getAlbums,
              icon: Icons.file_download,
              title: "Get Albums",
            ),
            loading ? Text('Loading...') : Text('Not loading'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _albums.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AlbumItem(
                      title: _albums[index].title,
                      userId: _albums[index].userId,
                      onPressed: () {
                        navigateToPhotos(context,  _albums[index].id);
                      },
                    );
                  }
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}

class Albums extends StatefulWidget {
  @override
  AlbumsState createState() => AlbumsState();
}