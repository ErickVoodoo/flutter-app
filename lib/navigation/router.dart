import 'package:flutter/material.dart';

import 'package:flutter_app/containers/albums.dart' as AlbumContainer;
import 'package:flutter_app/containers/photos.dart' as PhotosContainer;
import 'package:flutter_app/containers/information.dart' as InformationContainer;

import 'package:flutter_app/constants/routes.dart' as ROUTES;

getNavigation() {
  return MaterialApp(
    initialRoute: ROUTES.ROUTE_ALBUMS,
    home: AlbumContainer.Albums(),
    routes: {
      ROUTES.ROUTE_ALBUMS: (context) => AlbumContainer.Albums(),
      ROUTES.ROUTE_ALBUM_PHOTOS: (context) => PhotosContainer.Photos(),
      ROUTES.ROUTE_INFROMATION: (context) => InformationContainer.Information(),
    },
  );
}

