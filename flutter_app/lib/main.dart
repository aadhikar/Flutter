import 'package:flutter/material.dart';
import 'package:flutter_app/app_screens/favorateCity.dart';
import 'package:flutter_app/app_screens/home.dart';
import 'package:flutter_app/app_screens/basicListView.dart';
import 'package:flutter_app/app_screens/listsView.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exploring UI Widgets",
      home: FavorateCity(),
    ));
