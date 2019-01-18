import 'package:flutter/material.dart';

class SimpleInterestForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleInterestForm();
  }
}

class _SimpleInterestForm extends State<SimpleInterestForm> {
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  var _selectedItem = "Rupees";
  final _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getMoneyImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "Principal",
                    hintText: "Enter te Principal eg. 1000",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "Rate of Interest",
                    hintText: "Enter in percent",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      decoration: InputDecoration(
                        labelText: "Terms",
                        hintText: "Time in years",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: textStyle,
                            ),
                          );
                        }).toList(),
                        value: _selectedItem,
                        onChanged: (String newValueSelected) {
                          //Code to execute when Dropdown menu selected
                          _selectedItem = newValueSelected;
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          "Calculte",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {}),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Reset",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {}),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                "TODO",
                style: textStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getMoneyImageAsset() {
    return Container(
      margin: EdgeInsets.all(_minimumPadding * 10),
      child: Image(
        image: AssetImage('images/money.png'),
        width: 125.0,
        height: 125.0,
      ),
    );
  }
}
