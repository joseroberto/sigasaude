import 'package:covid_data_app/controller/maps_provider.dart';
import 'package:covid_data_app/controller/maps_singleton.dart';
import 'package:covid_data_app/helpers/loading_widget.dart';
import 'package:covid_data_app/screens/locations_screen/widgets/map_widget.dart';
import 'package:covid_data_app/themes/app_colors.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class CardExpanded extends StatelessWidget {
  final String title;
  final double media;
  final List<Widget> stars;
  final double lat;
  final double long;

  const CardExpanded(
      {Key? key,
      required this.stars,
      required this.title,
      required this.media,
      required this.lat,
      required this.long})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: AppColors.backButton,
        leadingWidth: 80,
        titleSpacing: 0,
        title: Text(
          title,
          style: AppColors.titleTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
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
              icon: const Icon(Icons.share),
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: MapsSingleton().mapProvider.drawPolyline(lat, long),
        builder: (context, snapshot) {
          return Consumer<MapsProvider>(
            builder: (context, value, _) {
              if (value.polylinePoints.isEmpty) {
                return const LoadingWidget();
              }
              return DraggableBottomSheet(
                barrierColor: Colors.transparent,
                useSafeArea: false,
                minExtent: 100,
                maxExtent: 325,
                backgroundWidget: MapWidget(lat: lat, long: long),
                previewWidget: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 8),
                        blurRadius: 24,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.keyboard_arrow_up_rounded,
                          size: 30, color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.string(
                                      _svg_location,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins'
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                ' (${value.totalDistance})',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Color(0xff000000),
                                  letterSpacing: 0.162,
                                  height: 2.16,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                expandedWidget: Container(
                  height: 325,
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.keyboard_arrow_down,
                          size: 30, color: Colors.black),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 16.0, top: 8.0),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: SvgPicture.string(
                                          _svg_location,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            title,
                                            style: AppColors.titleTextStyle,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3.0),
                                                child: Text('$media'),
                                              ),
                                              stars[0],
                                              stars[1],
                                              stars[2],
                                              stars[3],
                                              stars[4],
                                              const Text(
                                                '  (25)',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  color: Color(0xff0055ff),
                                                  letterSpacing: 0.126,
                                                  height: 1.7142857142857142,
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 4.0),
                                                child: Text(
                                                  'ABERTO ',
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
                                                    color: Color(0xff3bb87d),
                                                    letterSpacing: 0.144,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.75,
                                                  ),
                                                  textHeightBehavior:
                                                      TextHeightBehavior(
                                                          applyHeightToFirstAscent:
                                                              false),
                                                  softWrap: false,
                                                ),
                                              ),
                                              Text.rich(
                                                TextSpan(
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16,
                                                    color: Color(0xff000000),
                                                    letterSpacing: 0.144,
                                                    height: 1.5,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: '- ',
                                                    ),
                                                    TextSpan(
                                                      text: '24hrs',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff0055ff),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textHeightBehavior:
                                                    TextHeightBehavior(
                                                        applyHeightToFirstAscent:
                                                            false),
                                                softWrap: false,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    ' (${value.totalDistance})',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      color: Color(0xff000000),
                                      letterSpacing: 0.162,
                                      height: 2.16,
                                    ),
                                    textHeightBehavior:
                                        const TextHeightBehavior(
                                            applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Row(
                                children: [
                                  (title.contains('UPA')
                                      ? const _DisabledButton()
                                      : const _EnabledButton()
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: const Color(0xffd1d1d1),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: SizedBox(
                                              width: 18.0,
                                              height: 18.0,
                                              child: SvgPicture.string(
                                                _svg_phone,
                                                allowDrawingOutsideViewBox:
                                                true,
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 6.0),
                                            child: Text(
                                              'Ligar',
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 12,
                                                color: Color(0xff000000),
                                                letterSpacing: 0.108,
                                                height: 2,
                                              ),
                                              textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                  false),
                                              softWrap: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff00509f),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  elevation: 8,
                                ),
                                child: const SizedBox(
                                  width: 90.0,
                                  height: 25.0,
                                  child: Text(
                                    'Minha Rota',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: Color(0xffffffff),
                                      letterSpacing: -0.18,
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
                    ],
                  ),
                ),
                onDragging: (pop) {},
              );
            },
          );
        },
      ),
    );
  }
}

class _EnabledButton extends StatelessWidget {
  const _EnabledButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {Navigator.pushNamed(context, 'agendar_consulta');}),
      icon: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xffd1d1d1),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 18.0,
              height: 18.0,
              child: SvgPicture.string(
                _svg_calendar,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: 6.0),
              child: Text(
                'Agendar Consulta',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Color(0xff000000),
                  letterSpacing: 0.108,
                  height: 2,
                ),
                textHeightBehavior:
                TextHeightBehavior(
                    applyHeightToFirstAscent:
                    false),
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DisabledButton extends StatelessWidget {
  const _DisabledButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Colors.grey.withOpacity(.7),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 18.0,
              height: 18.0,
              child: SvgPicture.string(
                _svg_calendar,
                color: Colors.grey.withOpacity(.7),
                allowDrawingOutsideViewBox: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 6.0),
              child: Text(
                'Agendar Consulta',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Colors.grey.withOpacity(.7),
                  letterSpacing: 0.108,
                  height: 2,
                ),
                textHeightBehavior:
                const TextHeightBehavior(
                    applyHeightToFirstAscent:
                    false),
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


const String _svg_location =
    '<svg viewBox="23.0 90.0 10.3 14.7" ><path transform="translate(18.0, 88.0)" d="M 10.13476657867432 5.300920963287354 C 11.14757061004639 5.300920963287354 11.96861171722412 6.12196159362793 11.96861171722412 7.134766101837158 C 11.96861171722412 8.14756965637207 11.1475715637207 8.968610763549805 10.13476657867432 8.968610763549805 C 9.121960639953613 8.968610763549805 8.300919532775879 8.14756965637207 8.300920486450195 7.134764671325684 C 8.300921440124512 6.121962070465088 9.121960639953613 5.30092191696167 10.13476467132568 5.300920963287354 M 10.13476657867432 2 C 12.97062015533447 2 15.26953315734863 4.298913955688477 15.26953220367432 7.134766578674316 C 15.26953220367432 10.98583984375 10.13476657867432 16.6707592010498 10.13476657867432 16.6707592010498 C 10.13476657867432 16.6707592010498 5 10.98583984375 5 7.134766101837158 C 5.000000953674316 4.29891300201416 7.298914432525635 1.999999284744263 10.13476753234863 2 M 10.13476657867432 3.467076063156128 C 8.109156608581543 3.467076063156128 6.467075824737549 5.109157085418701 6.467075824737549 7.134766578674316 C 6.467075824737549 7.868303775787354 6.467075824737549 9.335379600524902 10.13476657867432 14.25741863250732 C 13.80245590209961 9.335379600524902 13.80245590209961 7.868303775787354 13.80245590209961 7.134766101837158 C 13.80245590209961 5.109156608581543 12.16037464141846 3.467076063156128 10.13476657867432 3.467076063156128 Z" fill="#00509f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_calendar =
    '<svg viewBox="313.0 333.0 18.0 20.0" ><path transform="translate(310.0, 332.0)" d="M 7 11 L 9 11 L 9 13 L 7 13 L 7 11 M 21 5 L 21 19 C 21 20.11000061035156 20.11000061035156 21 19 21 L 5 21 C 3.890000104904175 21 3 20.10000038146973 3 19 L 3 5 C 3 3.900000095367432 3.900000095367432 3 5 3 L 6 3 L 6 1 L 8 1 L 8 3 L 16 3 L 16 1 L 18 1 L 18 3 L 19 3 C 20.11000061035156 3 21 3.900000095367432 21 5 M 5 7 L 19 7 L 19 5 L 5 5 L 5 7 M 19 19 L 19 9 L 5 9 L 5 19 L 19 19 M 15 13 L 15 11 L 17 11 L 17 13 L 15 13 M 11 13 L 11 11 L 13 11 L 13 13 L 11 13 M 7 15 L 9 15 L 9 17 L 7 17 L 7 15 M 15 17 L 15 15 L 17 15 L 17 17 L 15 17 M 11 17 L 11 15 L 13 15 L 13 17 L 11 17 Z" fill="#2b2f3b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_phone =
    '<svg viewBox="313.0 259.0 18.0 18.0" ><path transform="translate(310.0, 256.0)" d="M 6.619999885559082 10.78999996185303 C 8.060000419616699 13.61999988555908 10.38000011444092 15.9399995803833 13.21000003814697 17.3799991607666 L 15.40999984741211 15.18000030517578 C 15.6899995803833 14.89999961853027 16.07999992370605 14.81999969482422 16.43000030517578 14.93000030517578 C 17.54999923706055 15.30000019073486 18.75 15.5 20 15.5 C 20.55228424072266 15.5 21 15.94771575927734 21 16.5 L 21 20 C 21 20.55228424072266 20.55228424072266 21 20 21 C 10.61115837097168 21 3 13.38883972167969 3 3.999999046325684 C 3 3.447715520858765 3.447714805603027 3.000000476837158 3.999999046325684 3 L 7.5 3 C 8.052285194396973 3 8.5 3.447715282440186 8.5 4 C 8.5 5.25 8.699999809265137 6.449999809265137 9.069999694824219 7.570000171661377 C 9.180000305175781 7.920000076293945 9.100000381469727 8.310000419616699 8.819999694824219 8.590000152587891 L 6.619999885559082 10.78999996185303 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
