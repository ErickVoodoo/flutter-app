const String API_URL = 'https://jsonplaceholder.typicode.com';
const String PATH_ALBUMS = '$API_URL/albums';

String PATH_ALBUM_PHOTOS(int albumId) {
  return '$API_URL/albums/$albumId/photos';
}