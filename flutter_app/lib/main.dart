import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/favorateCity.dart';
import 'package:flutter_app/app_screens/home.dart';
import 'package:flutter_app/app_screens/basicListView.dart';
import 'package:flutter_app/app_screens/listsView.dart';
import 'package:flutter_app/app_screens/simpleInterestForm.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring UI Widgets",
      home: SimpleInterestForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    ));
