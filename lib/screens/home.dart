import 'package:flutter/material.dart';
import 'package:coffeehouse_reviews/map/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/extension_api.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:coffeehouse_reviews/screens/location_info.dart';
import 'package:coffeehouse_reviews/models/cafe.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:coffeehouse_reviews/modals/floating_modal.dart';
import 'package:coffeehouse_reviews/modals/modal_fit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final ark = new Cafe(
      address: '123 test street',
      id: 1,
      name: 'Test Cafe',
      review: 'The flat white is great here.',
      location: LatLng(-36.7897367, 174.77));

  static final copper = new Cafe(
      address: '123 test street',
      id: 2,
      name: 'Test Cafe',
      review: 'The flat white is great here.',
      location: LatLng(-36.7311, 174.7129));

  //static final ark = LatLng(-36.7897367, 174.77);
  //static final copper = LatLng(-36.7311, 174.7129);
  static final toasted = LatLng(-36.767, 174.737429);
  static final corellis = LatLng(-36.829, 174.797);
  static final scarecrow = LatLng(-36.8497, 174.765);
  static final Marker markerArk = createNewMarker(ark.location, ark.review);
  static final Marker markerCopper =
      createNewMarker(copper.location, copper.review);
  /*  markerToasted = createNewMarker(toasted),
      markerCorellis = createNewMarker(corellis),
      markerScarecrow = createNewMarker(scarecrow); */

  final PopupController _popupLayerController = PopupController();

  List<Marker> _markers = [
    markerArk,
    markerCopper,
    /* markerToasted,
    markerCorellis,
    markerScarecrow, */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Coffee House Reviews'),
          // backgroundColor: Colors.brown[300],
          elevation: 20.0,
          actions: [
            IconButton(
              icon: Icon(Icons.dehaze),
              onPressed: () {
                Navigator.push(
                  // navigate to locations in list form
                  context,
                  MaterialPageRoute(builder: (context) => LocInfo()),
                );
              },
            )
          ],
        ),
        body: new FlutterMap(
          options: new MapOptions(
            screenSize: new Size(50.0, 20.0),
            center: new LatLng(-36.817401, 174.743),
            minZoom: 10.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(markers: _markers),
            //specific url for map template
          ],
        ));
  }
}

Marker createNewMarker(LatLng coord, String review) {
  //method to create a marker for each latlng point
  Marker mk = new Marker(
      width: 65.0,
      height: 65.0,
      point: coord,
      builder: (context) => new Container(
          child: IconButton(
              icon: Icon(Icons.location_on),
              color: Colors.brown[500],
              iconSize: 50.0,
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (builder) {
                      return Container(
                        child: Text(review),
                        padding: EdgeInsets.all(40.0),
                      );
                    });
              })));
  return mk;
}

//method to generate bottom sheets for each new marker on the map
void _settingBottomSheet(context) {}
