import 'package:covid_data_app/helpers/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../controller/appointments_singleton.dart';
import '../../main.dart';
import '../../themes/app_colors.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        leading: AppColors().backButtonWithAction(() => Navigator.pushReplacementNamed(context, 'home')),
        title: Text(
          'Suas Consultas',
          style: AppColors.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              style: IconButton.styleFrom(
                fixedSize: const Size(25, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
              ),
              onPressed: () {
                Navigator.pop(navigatorKey!.currentContext!);
              },
              icon: Image.asset('assets/images/icon_list.png'),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: AppointmentsSingleton().appointmentsProvider.loadAppointments(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const LoadingWidget();
          } else if(snapshot.data!.isEmpty) {
            return SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: (screenMode == Orientation.landscape)
                    ? MediaQuery.of(context).size.height * 1.5
                    : MediaQuery.of(context).size.height * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/no_appointments.png',
                        width: 245,
                        height: 220,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75.0, bottom: 42.0),
                      child: Text(
                        'Você ainda não agendou\nnenhuma consulta!',
                        textAlign: TextAlign.center,
                        style: AppColors.titleTextStyle,
                      ),
                    ),
                    Text(
                      'Clique abaixo para agendar uma\nconsulta conosco',
                      style: AppColors.onBoardingSubTitleTextStyle,
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (context, index) {
              final date = DateTime.utc(2023, snapshot.data![index]["date"].month, snapshot.data![index]["date"].day);
              return Card(
                clipBehavior: Clip.hardEdge,
                elevation: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 22.0),
                            child: Icon(Icons.calendar_month),
                          ),
                          Expanded(
                            child: Text(
                              '${date.day}/${date.month}/${date.year} - ${snapshot.data![index]["time"]}',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(0, 168, 88, 1),
                                fontWeight: FontWeight.bold
                              ),
                            ),
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
                              Navigator.pushNamed(context, 'agendar_consulta');
                              AppointmentsSingleton().appointmentsProvider.showAppointmentTime(snapshot.data![index]["time"]);
                              AppointmentsSingleton().appointmentsProvider.updateSelectedDay(snapshot.data![index]["date"]);
                            },
                            icon: const Icon(MaterialCommunityIcons.pencil_outline),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UBS 06 - Lourem Ipsum (500m)'
                            , style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700
                          ),
                          ),
                          Text(
                              'DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              color: Color.fromRGBO(0, 0, 0, 0.6)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'agendar_consulta');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00509f),
              foregroundColor: const Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            child: const Text(
              'Agendar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0xffffffff),
                letterSpacing: 0.1612,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
