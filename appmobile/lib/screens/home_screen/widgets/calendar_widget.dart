import 'dart:collection';
import 'package:covid_data_app/consultas_list.dart';
import 'package:covid_data_app/controller/appointments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

LinkedHashMap<DateTime, List<Map<String, dynamic>>>? _groupedEvents;

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDay = DateTime(2023, 5, 1);
  List<Map<String, dynamic>> events = consultasList;

  int getHashCode(DateTime key) {
    return key.day * 10000 + key.month;
  }

  _groupEvents(List<Map<String, dynamic>> events) {
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (var event in events) {
      DateTime date = DateTime.utc(
          event["date"].year, event["date"].month, event["date"].day);
      if (_groupedEvents?[date] == null) _groupedEvents?[date] = [];
      _groupedEvents![date]!.add(event);
    }
  }

  List<dynamic> _getUnavaiablesDays(DateTime date) {
    return _groupedEvents?[date] ?? [];
  }

  @override
  void initState() {
    _groupEvents(events);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentsProvider>(
        builder: (context, value, _) {
          return TableCalendar(
            locale: 'pt_br',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: value.selectedDay,
            currentDay: DateTime.now(),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  Map<String, dynamic> obj = events[0] as Map<String, dynamic>;
                  String title = obj['title'];
                  DateTime date = obj['date'];
                  if (title == 'marked') {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 5,
                          child: Container(
                            width: 38,
                            height: 43,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 168, 88, 1),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                date.day.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'OpenSans'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 5,
                        child: Container(
                          width: 38,
                          height: 43,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(207, 222, 237, 1),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.6),
                                  fontSize: 15,
                                  fontFamily: 'OpenSans'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xff000000),
                  letterSpacing: 0.162,
                  height: 2,
                ),
                formatButtonVisible: false,
                titleCentered: true),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(color: Color.fromRGBO(0, 80, 159, 1), shape: BoxShape.circle),
              outsideDaysVisible: false,
            ),
            eventLoader: _getUnavaiablesDays,
            onDaySelected: (newSelectedDay, newFocusedDay) {
              setState(() {
                selectedDay = newSelectedDay;
                value.updateSelectedDay(selectedDay);
                if(_getUnavaiablesDays(selectedDay).isEmpty) {
                  value.resetTime();
                }
                _getUnavaiablesDays(selectedDay).forEach((event) {
                  if(event["title"] == 'marked') {
                    value.showAppointmentTime(event["time"]);
                  }
                });
              });
            },
            selectedDayPredicate: (day) => isSameDay(day, value.selectedDay),
          );
        }
    );
  }
}
