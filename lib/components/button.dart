import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    @required this.title,
    @required this.onPressed,
    @protected this.icon,
  });

  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  final GestureTapCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 180,
      child: RawMaterialButton(
        fillColor: Colors.red,
        child: Padding(
          padding: EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
          child: Row(
            children: <Widget>[
                Icon(icon, color: Colors.white,),
                SizedBox(width: 12),
                Text(title, style: textStyle),
              ],
            ),
        ),
        onPressed: onPressed,
        shape: StadiumBorder(),
      ),
    );
  }
}