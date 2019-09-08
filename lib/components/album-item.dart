import 'package:flutter/material.dart';
import 'package:flutter_app/utils/colors.dart';

class AlbumItem extends StatelessWidget {
  AlbumItem({
    @required this.title,
    @required this.userId,
    this.onPressed,
  });

  final String title;
  final int userId;
  final Function onPressed;

  final TextStyle titleStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  final TextStyle userIdStyle = TextStyle(
    color: Colors.white70,
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  final List<Color> color = getGradient();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: titleStyle, textAlign: TextAlign.left, maxLines: 1, overflow: TextOverflow.ellipsis,),
            SizedBox(height: 8,),
            Text(
              'User Id: $userId',
              style: userIdStyle,
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ),
    );
  }
}