import 'package:flutter/material.dart';
import 'package:foodie/config/config.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  String _currentAddress;
  double myLat = 27.686386;
  double myLng = 83.432426;

  Future<void> _getLocation() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
print("my current position is $position");
    setState(() {
      myLat = position.latitude;
      myLng = position.longitude;
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(myLat, myLng);

      Placemark place = p[0];
      setState(() {
        _currentAddress = place.street;
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  Set<Marker> markers = {};

  @override
  void initState() {
    _getLocation();
    markers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        flat: true,
        onTap: () {
          print('Marker Tapped');
        },
        onDragEnd: (val) {
          setState(() {
            myLat = val.latitude;
            myLng = val.longitude;
          });
        },
        position: LatLng(myLat, myLng)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
    decoration:
        BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(25)),
    height: 50,
    width: double.infinity,
    child: FlatButton(
        onPressed: () {
          _getAddressFromLatLng();
        },
        child: Text(
          "Pick Here",
          style: TextStyle(color: Colors.white, fontSize: 15),
        )),
  )
          ),
        body: SafeArea(
                  child: Stack(children: [
                  Positioned(
                      top: 10,
                      left: 10,
                      child: Icon(
                        Icons.arrow_back,
                        color: mainColor,
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: markers,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(myLat, myLng),
                        zoom: 16,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                ]),
        ));
  }
}
