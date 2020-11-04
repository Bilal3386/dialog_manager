import 'dart:async';
import 'package:dialog_manager/home/home_view.dart';
import 'package:dialog_manager/locator.dart';
import 'package:dialog_manager/manager/dialog_manager.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, widget) => Navigator(
        onGenerateRoute: (setting) => MaterialPageRoute(builder: (context) => DialogManager(child: widget)),
      ),
      home: HomeView(),
    );
  }
}
