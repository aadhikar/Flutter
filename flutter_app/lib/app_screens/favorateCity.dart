import 'package:flutter/material.dart';

class FavorateCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavorateCityState();
  }
}

class _FavorateCityState extends State<FavorateCity> {
  String nameCity = "";
  var _currencies = ["Dollors", "Rupees", "Pounds", "Others"];
  var _currenteItemSelected = "Rupee";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint("Created FavorateCity widget");
    return Scaffold(
      appBar: AppBar(
        title: Text("First Stateful App"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint(
                      "setState called, tis tells the fwk to redraw the FavorateCity widget");
                  nameCity = userInput;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your best city $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newStringValue) {
                // Code to execute, when menu item is selected from Dropdown
                _onDropDwonItemSelected(newStringValue);
              },
              value: _currenteItemSelected,
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your Selected $_currenteItemSelected",
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onDropDwonItemSelected(String newDropDownItem) {
    setState(() {
      this._currenteItemSelected = newDropDownItem;
    });
  }
}
