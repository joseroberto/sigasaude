import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapsProvider extends ChangeNotifier {
  static String? apiKey = dotenv.env['GOOGLE_POLYLINE_API_KEY'];
  Set<Polyline> _polylinePoints = {};
  final String _totalDistance = '500m';
  List<LatLng> _coordinates = [];
  BitmapDescriptor _sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _destinationIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor get sourceIcon => _sourceIcon;

  BitmapDescriptor get destinationIcon => _destinationIcon;

  Set<Polyline> get polylinePoints => _polylinePoints;

  String get totalDistance => _totalDistance;

  static const sourceLocation = LatLng(-15.834697165017424, -48.02502463766898);

  Future<void> drawPolyline(double lat, double long) async {
    _polylinePoints = {};
    _coordinates = [];
    PolylinePoints points = PolylinePoints();
    PolylineResult result = await points.getRouteBetweenCoordinates(
        '$apiKey',
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(lat, long)
    );
    print('OLHA A API AI ${result.status}');

    if(result.status == 'OK') {
      for(var point in result.points) {
        _coordinates.add(
          LatLng(
            point.latitude, point.longitude,
          ),
        );
      }

      _polylinePoints.add(
          Polyline(
              polylineId: const PolylineId('route'),
              points: _coordinates,
              width: 3,
              color: Colors.red
          )
      );
    }

    notifyListeners();
  }

  void setCustomMarkerIcon() async {
    await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0, size: Size(34, 48)), 'assets/images/home_location.png').then((icon) => _sourceIcon = icon);
    await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0, size: Size(34, 48)), 'assets/images/destination_location.png').then((icon) => _destinationIcon = icon);
  }
}
