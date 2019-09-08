import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'components/button.dart';
import 'components/list-item.dart';

class ComponentsState extends State<Components> {

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  void getAlbums() {
    Http.get('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Button(
              onPressed: getAlbums,
              icon: Icons.file_download,
              title: "Get Albums",
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(
                  title: 'hELLO WORLD2',
                  description: "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  createdAt: '10/20/2019',
                  imageUri: 'https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg',
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

class Components extends StatefulWidget {
  @override
  ComponentsState createState() => ComponentsState();
}