import 'package:covid_data_app/controller/appointments_singleton.dart';
import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';

class ConsultaConfirmadaScreen extends StatelessWidget {
  final String day;
  final String month;
  final String time;
  const ConsultaConfirmadaScreen({Key? key, required this.day, required this.month, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: (screenMode == Orientation.landscape) ? 40 : 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: AppColors.backButton,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AppColors.closeButton,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: (screenMode == Orientation.landscape) ? MediaQuery.of(context).size.height * 1.2 : MediaQuery.of(context).size.height * .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/consulta_confirmada.png',
                  width: 245,
                  height: 220,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 24.0),
                child: Text(
                  'Consulta confirmada\ncom sucesso!',
                  textAlign: TextAlign.center,
                  style: AppColors.titleTextStyle,
                ),
              ),
              Text(
                'Aguarde até a data e não\nesqueça do horário!',
                style: AppColors.onBoardingSubTitleTextStyle,
                textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: (screenMode == Orientation.landscape)
                            ? _LandscapeContainer(day: day, month: month, time: time)
                            : _PortraitContainer(day: day, month: month, time: time),
    );
  }
}

class _PortraitContainer extends StatelessWidget {
  final String day;
  final String month;
  final String time;
  const _PortraitContainer({Key? key, required this.day, required this.month, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 230,
      decoration: BoxDecoration(
        color: const Color(0xff00509f),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey.withOpacity(.7),
            ),
            width: 35,
            height: 4,
          ),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    color: Color(0xffffffff),
                    letterSpacing: 0.19799999999999998,
                    height: 1.5454545454545454,
                  ),
                  children: [
                    TextSpan(
                      text: day,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' de $month de 2023 ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
              Text.rich(
                TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 21,
                    color: Color(0xffffffff),
                    letterSpacing: 0.18899999999999997,
                    height: 1.5238095238095237,
                  ),
                  children: [
                    const TextSpan(
                      text: 'ás ',
                    ),
                    TextSpan(
                      text: '${time}h',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )
            ],
          ),
          const Column(
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xffffffff),
                    letterSpacing: 0.10799999999999998,
                    height: 1.4166666666666667,
                  ),
                  children: [
                    TextSpan(
                      text: 'UBS 06',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                      ' - DF-075, Km 180, Área Especial,\nEPNB - Brasília - DF, 71705-510',
                    ),
                  ],
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'appointments');
                  AppointmentsSingleton().appointmentsProvider.resetTime();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                  foregroundColor: const Color(0xff00509f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xff00509f),
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
    );
  }
}

class _LandscapeContainer extends StatelessWidget {
  final String day;
  final String month;
  final String time;
  const _LandscapeContainer({Key? key, required this.day, required this.month, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff00509f),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.grey.withOpacity(.7),
            ),
            width: 35,
            height: 4,
          ),
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                color: Color(0xffffffff),
                letterSpacing: 0.19799999999999998,
                height: 1.5454545454545454,
              ),
              children: [
                TextSpan(
                  text: day,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ' de $month de 2023 ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const TextSpan(
                  text: 'ás ',
                ),
                TextSpan(
                  text: '${time}h',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
          const Column(
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xffffffff),
                    letterSpacing: 0.10799999999999998,
                    height: 1.4166666666666667,
                  ),
                  children: [
                    TextSpan(
                      text: 'UPA II',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text:
                      ' - DF-075, Km 180, Área Especial, EPNB - Brasília - DF, 71705-510',
                    ),
                  ],
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'appointments');
                  AppointmentsSingleton().appointmentsProvider.resetTime();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                  foregroundColor: const Color(0xff00509f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xff00509f),
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
    );
  }
}


