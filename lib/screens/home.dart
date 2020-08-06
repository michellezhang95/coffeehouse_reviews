import 'package:flutter/material.dart';
import 'package:coffeehouse_reviews/map/location.dart';
import 'package:flutter_map/flutter_map.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Coffee House Reviews'),
          backgroundColor: Colors.brown[300],
        ),
        body: new FlutterMap(options: null));
  }
}
