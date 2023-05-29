import 'package:covid_data_app/controller/appointments_provider.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class AppointmentsSingleton {
  AppointmentsProvider _appointmentsProvider = AppointmentsProvider();

  AppointmentsProvider get appointmentsProvider => _appointmentsProvider;

  static final AppointmentsSingleton _singleton = AppointmentsSingleton._internal();

  factory AppointmentsSingleton() {
    return _singleton;
  }

  AppointmentsSingleton._internal() {
    _appointmentsProvider = Provider.of<AppointmentsProvider>(navigatorKey!.currentContext!, listen: false);
  }
}