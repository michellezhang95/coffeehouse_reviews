//import 'package:coffeehouse_reviews/map/location.dart';
import 'package:latlong/latlong.dart';

/* 'a class to hold data about a cafe which the bottom sheet in home.dart
would access ' */

class Cafe {
  final int id; //cafe identifier
  final String name;
  final String address;
  final String review;
  final LatLng location;

  //constructor
  Cafe({this.id, this.name, this.address, this.review, this.location});
}
