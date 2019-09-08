import 'package:flutter_app/utils/webservice.dart';

import 'package:flutter_app/constants/paths.dart' as PATHS;

class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({ this.albumId, this.id, this.title, this.url, this.thumbnailUrl });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  static Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) {
    return Webservice.get(PATHS.PATH_ALBUM_PHOTOS(albumId))
      .then((photos) {
        return photos.map<PhotoModel>((photo) {
          return PhotoModel.fromJson(photo);
        }).toList();
      });
  }
}