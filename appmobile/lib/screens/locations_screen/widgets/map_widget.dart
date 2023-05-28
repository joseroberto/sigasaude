import 'dart:async';
import 'package:covid_data_app/controller/maps_provider.dart';
import 'package:covid_data_app/controller/maps_singleton.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  final double lat;
  final double long;
  const MapWidget({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const sourceLocation = LatLng(-15.834697165017424, -48.02502463766898);

  List<LatLng> polyCoordinates = [];

  @override
  Widget build(BuildContext context) {
    final destination = LatLng(widget.lat, widget.long);
    return Scaffold(
      appBar: null,
      body: Consumer<MapsProvider>(
        builder: (context, value, _) {
          return SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .75,
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: const CameraPosition(
                  target: sourceLocation,
                  zoom: 13.5
              ),
              polylines: value.polylinePoints,
              markers: {
                Marker(
                  icon: MapsSingleton().mapProvider.sourceIcon,
                  markerId: const MarkerId("source"),
                  position: sourceLocation,
                ),
                Marker(
                  icon:  MapsSingleton().mapProvider.destinationIcon,
                  markerId: const MarkerId("destination"),
                  position: destination,
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
