import 'package:covid_data_app/controller/maps_provider.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class MapsSingleton {
  MapsProvider _mapProvider = MapsProvider();

  MapsProvider get mapProvider => _mapProvider;

  static final MapsSingleton _singleton = MapsSingleton._internal();

  factory MapsSingleton() {
    return _singleton;
  }

  MapsSingleton._internal() {
    _mapProvider = Provider.of<MapsProvider>(navigatorKey!.currentContext!, listen: false);
  }
}