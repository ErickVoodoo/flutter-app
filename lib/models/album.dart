import 'package:flutter_app/constants/paths.dart' as PATHS;
import 'package:flutter_app/utils/webservice.dart';

class AlbumModel {
  final int userId;
  final int id;
  final String title;

  AlbumModel({ this.userId, this.id, this.title });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  static Future<List<AlbumModel>> get getAll {
    return Webservice.get(PATHS.PATH_ALBUMS).then((albums) {
      return albums.map<AlbumModel>((album) {
        return AlbumModel.fromJson(album);
      }).toList();
    });
  }
}
