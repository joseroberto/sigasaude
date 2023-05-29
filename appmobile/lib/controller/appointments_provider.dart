import 'package:flutter/material.dart';
import '../consultas_list.dart';

class AppointmentsProvider extends ChangeNotifier {
  String _selectedTime = '';
  List<Map<String, dynamic>> _list = [
    {"isSelected": false, "time": "08:00", "color": Colors.white},
    {"isSelected": false, "time": "08:30", "color": Colors.white},
    {"isSelected": false, "time": "09:00", "color": Colors.white},
    {"isSelected": false, "time": "09:30", "color": Colors.white},
    {"isSelected": false, "time": "10:00", "color": Colors.white},
    {"isSelected": false, "time": "10:30", "color": Colors.white},
    {"isSelected": false, "time": "11:00", "color": Colors.white},
    {"isSelected": false, "time": "11:30", "color": Colors.white},
    {"isSelected": false, "time": "14:00", "color": Colors.white},
    {"isSelected": false, "time": "14:30", "color": Colors.white},
    {"isSelected": false, "time": "15:00", "color": Colors.white},
    {"isSelected": false, "time": "15:30", "color": Colors.white},
    {"isSelected": false, "time": "16:00", "color": Colors.white},
    {"isSelected": false, "time": "16:30", "color": Colors.white},
    {"isSelected": false, "time": "17:00", "color": Colors.white},
    {"isSelected": false, "time": "17:30", "color": Colors.white}
  ];

  List<Map<String, dynamic>> listBd = [];

  DateTime _selectedDay = DateTime(2023, 5, 1);

  List<Map<String, dynamic>> get list => _list;

  DateTime get selectedDay => _selectedDay;

  String get selectedTime => _selectedTime;

  Future<List<Map<String, dynamic>>> loadAppointments() async {
    await Future.delayed(const Duration(seconds: 1));
    var result = consultasList.where((element) => element["title"] == 'marked').toList();
    listBd = result;
    return listBd;
  }

  void showAppointmentTime(String time) {
    for(var localElement in _list) {
      if(time == localElement["time"]) {
        localElement["color"] = const Color.fromRGBO(0, 168, 88, 1);
      }else {
        localElement["color"] = Colors.white;
      }
    }
  }

  void updateTimeIndex(String time) {
    for(var element in _list) {
      if(element["time"] == time) {
        element["isSelected"] = true;
        _selectedTime = element["time"];
      }else {
        element["isSelected"] = false;
      }
    }

    notifyListeners();
  }

  void updateSelectedDay(DateTime newDay) {
    _selectedDay = newDay;
    notifyListeners();
  }

  void resetTime() {
    _list = [
      {"isSelected": false, "time": "08:00", "color": Colors.white},
      {"isSelected": false, "time": "08:30", "color": Colors.white},
      {"isSelected": false, "time": "09:00", "color": Colors.white},
      {"isSelected": false, "time": "09:30", "color": Colors.white},
      {"isSelected": false, "time": "10:00", "color": Colors.white},
      {"isSelected": false, "time": "10:30", "color": Colors.white},
      {"isSelected": false, "time": "11:00", "color": Colors.white},
      {"isSelected": false, "time": "11:30", "color": Colors.white},
      {"isSelected": false, "time": "14:00", "color": Colors.white},
      {"isSelected": false, "time": "14:30", "color": Colors.white},
      {"isSelected": false, "time": "15:00", "color": Colors.white},
      {"isSelected": false, "time": "15:30", "color": Colors.white},
      {"isSelected": false, "time": "16:00", "color": Colors.white},
      {"isSelected": false, "time": "16:30", "color": Colors.white},
      {"isSelected": false, "time": "17:00", "color": Colors.white},
      {"isSelected": false, "time": "17:30", "color": Colors.white}
    ];

    notifyListeners();
  }
}