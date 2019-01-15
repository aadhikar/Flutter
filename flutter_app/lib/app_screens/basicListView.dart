import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        // Scrollable Widgets should be placed inside Scalffold Widget
        appBar: AppBar(
          title: Text("Basic List"),
        ),
        body: getBasicListView());
  }
}

// Basic ListView for only few list items
Widget getBasicListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("It's beautiful!"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () => debugPrint(
            "Landscape"), // It is not possible to add onTap() parameter when you have 100's of ListTiles
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Mobile"),
        subtitle: Text("+1 (987) 123-456"),
      ),
      ListTile(
        leading: Icon(Icons.laptop),
        title: Text("Windows"),
        subtitle: Text("Skyrock"),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Jane Doe"),
        subtitle: Text("+1 (987) 123-456"),
      ),
    ],
  );
  return listView;
}
