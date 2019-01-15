import 'package:flutter/material.dart';

class ListsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // Scrollable Widgets should be placed inside Scalffold Widget
      appBar: AppBar(
        title: Text("Long List"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Add More");
        },
        child: Icon(Icons.add),
        tooltip: "Add one more item",
      ),
    );
  }
}

List<String> getListItems(){
  return List<String>.generate(100, (counter) => "Item ${counter+1}");
}

void sowSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(content: Text("You clicked $item"),
    action: SnackBarAction(label: "UNDO",
        onPressed: () {
          debugPrint("Dummy UNDO action");
        }),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

Widget getListView() {
  var items = getListItems();

  return ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(items[index]),
      subtitle: Text("Here is ${items[index]}"),
      onTap: () {
        sowSnackBar(context, items[index]);
      },
    );
  });
}
