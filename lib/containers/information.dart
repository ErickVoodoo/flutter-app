import 'package:flutter/material.dart';
import 'package:flutter_app/models/photos.dart';

class InformationState extends State<Information> {
  final PhotoModel photo;

  InformationState({ @required this.photo });


  final TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Information')),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Hero(
                tag: photo.url,
                transitionOnUserGestures: true,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Image.network(photo.url, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Hero(
              tag: photo.title,
              transitionOnUserGestures: true,
              child: Material(
                  color: Colors.transparent,
                  type: MaterialType.transparency, // likely needed
                  child: Text(photo.title, style: titleStyle, textAlign: TextAlign.left),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Information extends StatefulWidget {
  final PhotoModel photo;

  Information({ Key key, this.photo }): super (key: key);

  @override
  InformationState createState() => InformationState(photo: photo);
}