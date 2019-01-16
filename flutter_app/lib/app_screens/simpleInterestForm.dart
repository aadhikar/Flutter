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
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest"),
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
                decoration: InputDecoration(
                    labelText: "Principal",
                    hintText: "Enter te Principal eg. 1000",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Rate of Interest",
                    hintText: "Enter in percent",
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
                      decoration: InputDecoration(
                        labelText: "Terms",
                        hintText: "Time in years",
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
                            child: Text(value),
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
                        child: Text("Calculte"),
                        onPressed: (){
                      
                    }),
                  ),
                  Container(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: RaisedButton(
                        child: Text("Reset"),
                        onPressed: (){

                        }),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(_minimumPadding * 2),
            child: Text("TODO"),)
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
