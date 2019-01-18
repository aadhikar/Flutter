import 'package:flutter/material.dart';

class SimpleInterestForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SimpleInterestForm();
  }
}

class _SimpleInterestForm extends State<SimpleInterestForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Dollars', 'Rupees', 'Pounds'];
  var _currentItemSelected = "";
  final _minimumPadding = 5.0;

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  String displayResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
          child: ListView(
            children: <Widget>[
              getMoneyImageAsset(),
              Padding(
                padding: EdgeInsets.only(
                  top: _minimumPadding,
                  bottom: _minimumPadding,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalController,
                  validator: (String value) {
                    if (value.isEmpty) {
//                      Write additional validations
                      return 'Please enter Principal amount';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Principal",
                    hintText: "Enter te Principal eg. 1000",
                    labelStyle: textStyle,
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _minimumPadding,
                  bottom: _minimumPadding,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: roiController,
                  validator: (String value) {
                    if (value.isEmpty) {
//                      Write additional validations
                      return 'Please enter Rate of Interest';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Rate of Interest",
                    hintText: "Enter in percent",
                    labelStyle: textStyle,
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _minimumPadding,
                  bottom: _minimumPadding,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: termController,
                        validator: (String value) {
                          if (value.isEmpty) {
//                            Write additional validations
                            return 'Please enter Term';
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Terms",
                          hintText: "Time in years",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0,
                          ),
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
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected) {
                            //Code to execute when Dropdown menu selected
                            _onDropDownItemSelected(newValueSelected);
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
                            "Calculate",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              this.displayResult = _calculateTotalReturn();
                            }
                          }),
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
                          onPressed: () {
                            _reset();
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding * 2),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
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

  void _onDropDownItemSelected(newValueSelected) {
    this._currentItemSelected = newValueSelected;
  }

  String _calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    return "After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected";
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
    _formKey.currentState.reset();
  }
}
