import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final Completer<GoogleMapController> _controller=Completer();
  static  const CameraPosition _kGooglePlex =  CameraPosition(
    target: LatLng(24.909529,67.142710),
    zoom: 14.4746,
  );

  final List<Marker> _marker=[];
  final List<Marker> _list= const [
    Marker(markerId: MarkerId('1'),
    position: LatLng(24.909529,67.142710),
    infoWindow: InfoWindow(title: 'Mypositioon')),
    Marker(markerId: MarkerId('2'),
        position: LatLng(24.911288, 67.127724),
        infoWindow: InfoWindow(title: 'Muneebs Location'))
  ];

  @override
  void initState(){
super.initState();
_marker.addAll(_list);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('GoogleMaps'),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}
