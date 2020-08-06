import 'package:flutter/material.dart';
import 'package:coffeehouse_reviews/map/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<LatLng> _points = [
    LatLng(-36.7897367, 174.77), // ark company takapuna
    LatLng(-36.8486, 174.766), //the shelf
    LatLng(-36.768, 174.737), //toasted coffee roasters
    LatLng(-36.829, 174.797), //corelli's
    LatLng(-36.8497, 174.765), // scarecrow
  ];

  final PopupController _popupLayerController = PopupController();

  List<Marker> _markers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Coffee House Reviews'),
          backgroundColor: Colors.brown[300],
        ),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(-36.817401, 174.743),
            minZoom: 10.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: [
              new Marker(
                  width: 65.0,
                  height: 65.0,
                  point: new LatLng(-36.7897367, 174.77),
                  builder: (context) => new Container(
                      child: IconButton(
                          icon: Icon(Icons.location_on),
                          color: Colors.brown[500],
                          iconSize: 50.0,
                          onPressed: () {
                            print('tapped');
                          }))),
            ]), //specific url for map template
          ],
        ));
  }

  Marker createNewMarker() {
    //method to create a marker for each latlng point
  }
}
