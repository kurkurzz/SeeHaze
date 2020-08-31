import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EmbedPage extends StatefulWidget {
  @override
  _EmbedPageState createState() => _EmbedPageState();
}

class _EmbedPageState extends State<EmbedPage> {

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(4.2105, 101.9758),
                zoom: 15.0
                ) ,
              mapType: MapType.hybrid,      
              onMapCreated: (GoogleMapController controller) {
              
              setState(() {
                _controller.complete(controller);
              });
              }  
            ),
          ],
        ),
      ),
    );
  }




}