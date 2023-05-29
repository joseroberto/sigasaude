import 'package:covid_data_app/consultas_list.dart';
import 'package:covid_data_app/controller/appointments_provider.dart';
import 'package:covid_data_app/controller/appointments_singleton.dart';
import 'package:covid_data_app/screens/home_screen/widgets/calendar_widget.dart';
import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/consulta_confirmada.dart';

class AgendarConsulta extends StatefulWidget {
  const AgendarConsulta({Key? key}) : super(key: key);

  @override
  State<AgendarConsulta> createState() => _AgendarConsultaState();
}

class _AgendarConsultaState extends State<AgendarConsulta> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        leadingWidth: 70,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 32.0),
          child: Text(
            'Sua Consulta',
            style: AppColors.titleTextStyle,
          ),
        ),
        leading: Align(
            alignment: Alignment.bottomCenter,
            child: AppColors().backButtonWithAction(() => {
            AppointmentsSingleton().appointmentsProvider.resetTime(),
            Navigator.pop(context)
            })),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 32.0),
            child: AppColors().closeButtonWithAction(() => {
              AppointmentsSingleton().appointmentsProvider.resetTime(),
              Navigator.pop(context)
            }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(237, 240, 242, 1),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'UBS 06',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Color(0xff2c3e50),
                              letterSpacing: 0.14400000000000002,
                              fontWeight: FontWeight.w600,
                              height: 0.7777777777777778,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Color(0xff2c3e50),
                              letterSpacing: 0.128,
                              height: 1.1666666666666667,
                            ),
                            children: [
                              TextSpan(
                                text:
                                'DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                                style: TextStyle(
                                  fontSize: 12,
                                  letterSpacing: 0.096,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ],
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        maximumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        side: const BorderSide(
                            width: 1,
                            color: Color.fromRGBO(196, 197, 198, 1)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'locations');
                      },
                      icon: const Icon(
                          MaterialCommunityIcons.pencil_outline),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CalendarWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _ColorDescription(
                          description: 'Hoje',
                          color: Color.fromRGBO(0, 80, 159, 1)),
                      _ColorDescription(
                          description: 'Não disponível',
                          color: Color.fromRGBO(207, 222, 237, 0.7)),
                      _ColorDescription(
                          description: 'Marcado',
                          color: Color.fromRGBO(0, 168, 88, 1)),
                    ],
                  ),
                ),
              ),
              const _TimeGrid(),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: SizedBox(
                  width: width * .9,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, 'forms');
                      if(AppointmentsSingleton().appointmentsProvider.selectedTime != '') {
                        String day = AppointmentsSingleton().appointmentsProvider.selectedDay.day.toString();
                        String monthName = DateFormat('MMMM', 'pt_BR').format(AppointmentsSingleton().appointmentsProvider.selectedDay);
                        String time = AppointmentsSingleton().appointmentsProvider.selectedTime.toString();
                        consultasList.add(
                            {
                              "date": AppointmentsSingleton().appointmentsProvider.selectedDay,
                              "time": AppointmentsSingleton().appointmentsProvider.selectedTime,
                              "title": "marked"
                            }
                        );
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return ConsultaConfirmadaScreen(day: day, month: monthName, time: time,);
                        }));
                      }else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(duration: Duration(milliseconds: 1000), content: Text('Por favor, selecione um horário!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00509f),
                      foregroundColor: const Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    child: const Text(
                      'Marcar Consulta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Color(0xffffffff),
                        letterSpacing: 0.1612,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ColorDescription extends StatelessWidget {
  final String description;
  final Color color;

  const _ColorDescription(
      {Key? key, required this.description, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(shape: BoxShape.rectangle, color: color),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 10,
            color: Color(0xffb1b1b0),
            height: 1.2,
          ),
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
      ],
    );
  }
}

class _TimeGrid extends StatefulWidget {
  const _TimeGrid({Key? key}) : super(key: key);

  @override
  State<_TimeGrid> createState() => _TimeGridState();
}

class _TimeGridState extends State<_TimeGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentsProvider>(
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0, top: 40.0),
                    child: Text(
                      'Manhã',
                      style: AppColors.titleTextStyle,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 24.0,
                        crossAxisSpacing: 16.0,
                        mainAxisExtent: 34),
                    itemCount: 8,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: (() {
                          value.updateTimeIndex(value.list[index]["time"]);
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: (value.list[index]["isSelected"])
                                  ? const Color.fromRGBO(0, 80, 159, 1)
                                  : value.list[index]["color"],
                              border: Border.all(
                                  color: const Color.fromRGBO(112, 112, 112, 1),
                                  width: 1.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Text(
                              value.list[index]["time"],
                              style: TextStyle(
                                  color: (value.list[index]["isSelected"] || value.list[index]["color"] != Colors.white)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0, top: 40.0),
                    child: Text(
                      'Tarde',
                      style: AppColors.titleTextStyle,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 24.0,
                        crossAxisSpacing: 16.0,
                        mainAxisExtent: 34),
                    itemCount: 8,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: (() {
                          value.updateTimeIndex(value.list[index + 8]["time"]);
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: (value.list[index + 8]["isSelected"])
                                  ? const Color.fromRGBO(0, 80, 159, 1)
                                  : value.list[index + 8]["color"],
                              border: Border.all(
                                  color: const Color.fromRGBO(112, 112, 112, 1),
                                  width: 1.0),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                            child: Text(
                              value.list[index + 8]["time"],
                              style: TextStyle(
                                  color: (value.list[index + 8]["isSelected"] || value.list[index + 8]["color"] != Colors.white)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}
