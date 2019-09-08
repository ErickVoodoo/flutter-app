import 'package:flutter/material.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:transparent_image/transparent_image.dart';

class ListItem extends StatelessWidget {
  ListItem({
    @required this.title,
    this.description,
    @required this.imageUri,
  });

  final String title;
  final String description;
  final String imageUri;

  final TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  final TextStyle descriptionStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );

  final List<Color> color = getGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color[0],
        borderRadius: BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(colors: color),
        boxShadow: [
          BoxShadow(
            color: color[0],
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fadeInDuration: Duration(milliseconds: 300),
              image: imageUri,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: titleStyle, textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 8,),
                  Text(description, style: descriptionStyle, textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}