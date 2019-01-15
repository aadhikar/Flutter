import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 30.0),
          alignment: Alignment.center,
          color: Colors.blue[300],
//        width: 200.0, // Works within Center Widget
//        height: 100.0, // Works within Center Widget
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Delta",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w700),
                  )),
                  Expanded(
                      child: Text(
                    "From Austin to New York via Atlanta",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        color: Colors.white,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Southwest",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25.0,
                        color: Colors.white,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w700),
                  )),
                  Expanded(
                      child: Text(
                    "From New York to Austin via Dallas",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 30.0,
                        color: Colors.white,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
              FlightImageAsset(),
              FlightBookButton()
            ],
          )),
    );
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image(
        image: AssetImage('images/flight.png'),
        width: 200.0,
        height: 200.0,
      ),
    );
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 35.0,
      width: 200.0,
      child: RaisedButton(
          color: Colors.deepOrange,
          child: Text(
            "Book Your Flight",
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.w400),
          ),
          elevation: 6.0,
          onPressed: () => bookFlight(context)),
    );
  }

  void bookFlight(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Flight Booked Successfully"),
              content: Text("Have Safe Flight!"),
            ));
  }
}
