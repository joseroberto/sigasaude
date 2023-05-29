import 'package:covid_data_app/locations_list.dart';
import 'package:covid_data_app/screens/locations_screen/widgets/card_expanded.dart';
import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationsScreen extends StatelessWidget {
  LocationsScreen({Key? key}) : super(key: key);

  List<Widget> stars = [];

  @override
  Widget build(BuildContext context) {
    List locations = locationsList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 80,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        leading: AppColors.backButton,
        title: Text(
          'Estabelecimentos',
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
              onPressed: () {},
              icon: Image.asset('assets/images/icon_list.png'),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            collapsedHeight: 100,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 16),
                      child: SizedBox(
                        child: SvgPicture.string(
                          _svg_location,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 16.0, 8.0, 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'R. Geraldo Costa, 880',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Color(0xff000000),
                              letterSpacing: 0.126,
                              fontWeight: FontWeight.w500,
                              height: 1.7142857142857142,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                          Text(
                            'Apto 303 - Edificio Ilha do Sul',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 10,
                              color: Color(0x99000000),
                              letterSpacing: 0.05399999999999999,
                              height: 2.8333333333333335,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.arrow_forward_ios_sharp),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            stars = [];
            generateStarList(locations[index]["stars"]["qtd"], stars);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CardExpanded(
                      media: locations[index]["stars"]["media"],
                      stars: stars,
                      title: locations[index]["placeName"],
                      lat: locations[index]["coordinates"]["lat"],
                      long: locations[index]["coordinates"]["long"],
                    );
                  }));
                }),
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 1,
                  child: Column(
                    children: [
                      Image(
                        height: 130,
                        width: double.infinity,
                        image: AssetImage(locations[index]["imagePath"]),
                        fit: BoxFit.cover,
                      ),
                      _ListStarGenerator(
                        stars: stars,
                        title: locations[index]["placeName"],
                        address: locations[index]["address"],
                        media: locations[index]["stars"]["media"],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, childCount: 4))
        ],
      ),
    );
  }
}

void generateStarList(int qtd, List<Widget> stars) {
  for (var i = 0; i < qtd; i++) {
    stars.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
        child: SizedBox(
          child: SvgPicture.string(
            _svg_yellowStar,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ),
    );
  }
  if (qtd < 5) {
    for (var i = 5 - qtd; i >= 0 - 5; i--) {
      stars.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
          child: SizedBox(
            child: SvgPicture.string(
              _svg_greyStar,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
      );
    }
  }
}

class _ListStarGenerator extends StatelessWidget {
  final String title;
  final String address;
  final double media;
  final List<Widget> stars;

  const _ListStarGenerator(
      {Key? key,
      required this.stars,
      required this.title,
      required this.address,
      required this.media})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 12.0, 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  color: Color(0xff000000),
                  letterSpacing: 0.144,
                  fontWeight: FontWeight.w500,
                  height: 1.375,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  address,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 10,
                    color: Color(0x99000000),
                    letterSpacing: 0.072,
                    height: 1.625,
                  ),
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
              SizedBox(
                width: 150,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        '$media',
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 11,
                          color: Color(0xff000000),
                          letterSpacing: 0.09899999999999999,
                          height: 1.7272727272727273,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                    stars[0],
                    stars[1],
                    stars[2],
                    stars[3],
                    stars[4],
                    const Padding(
                      padding: EdgeInsets.only(left: 4.0, bottom: 1.0),
                      child: Text(
                        '(25)',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 11,
                          color: Color(0xff66a3ff),
                          letterSpacing: 0.09899999999999999,
                          height: 1.7272727272727273,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Column(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  fixedSize: const Size(24, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: const BorderSide(
                      width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
                ),
                onPressed: () {
                  // Ação do botão
                },
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: SvgPicture.string(
                    _svg_phone,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  fixedSize: const Size(24, 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: const BorderSide(
                      width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
                ),
                onPressed: () {
                  // Ação do botão
                },
                icon: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: SvgPicture.string(
                    _svg_calendar,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

const String _svg_yellowStar =
    '<svg viewBox="41.8 0.0 10.4 9.9" ><path transform="translate(39.75, -2.0)" d="M 7.214382171630859 9.962361335754395 L 10.43686962127686 11.90732574462891 L 9.581711769104004 8.241615295410156 L 12.4287633895874 5.77521276473999 L 8.679622650146484 5.451920986175537 L 7.214382171630859 2 L 5.749140739440918 5.451920986175537 L 2 5.77521276473999 L 4.841838359832764 8.241615295410156 L 3.991894006729126 11.90732574462891 L 7.214382171630859 9.962361335754395 Z" fill="#ffd500" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_greyStar =
    '<svg viewBox="55.7 0.0 10.4 9.9" ><path transform="translate(53.67, -2.0)" d="M 7.214382171630859 9.962361335754395 L 10.43686962127686 11.90732574462891 L 9.581711769104004 8.241615295410156 L 12.4287633895874 5.77521276473999 L 8.679622650146484 5.451920986175537 L 7.214382171630859 2 L 5.749140739440918 5.451920986175537 L 2 5.77521276473999 L 4.841838359832764 8.241615295410156 L 3.991894006729126 11.90732574462891 L 7.214382171630859 9.962361335754395 Z" fill="#cecece" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_phone =
    '<svg viewBox="313.0 259.0 18.0 18.0" ><path transform="translate(310.0, 256.0)" d="M 6.619999885559082 10.78999996185303 C 8.060000419616699 13.61999988555908 10.38000011444092 15.9399995803833 13.21000003814697 17.3799991607666 L 15.40999984741211 15.18000030517578 C 15.6899995803833 14.89999961853027 16.07999992370605 14.81999969482422 16.43000030517578 14.93000030517578 C 17.54999923706055 15.30000019073486 18.75 15.5 20 15.5 C 20.55228424072266 15.5 21 15.94771575927734 21 16.5 L 21 20 C 21 20.55228424072266 20.55228424072266 21 20 21 C 10.61115837097168 21 3 13.38883972167969 3 3.999999046325684 C 3 3.447715520858765 3.447714805603027 3.000000476837158 3.999999046325684 3 L 7.5 3 C 8.052285194396973 3 8.5 3.447715282440186 8.5 4 C 8.5 5.25 8.699999809265137 6.449999809265137 9.069999694824219 7.570000171661377 C 9.180000305175781 7.920000076293945 9.100000381469727 8.310000419616699 8.819999694824219 8.590000152587891 L 6.619999885559082 10.78999996185303 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_calendar =
    '<svg viewBox="313.0 333.0 18.0 20.0" ><path transform="translate(310.0, 332.0)" d="M 7 11 L 9 11 L 9 13 L 7 13 L 7 11 M 21 5 L 21 19 C 21 20.11000061035156 20.11000061035156 21 19 21 L 5 21 C 3.890000104904175 21 3 20.10000038146973 3 19 L 3 5 C 3 3.900000095367432 3.900000095367432 3 5 3 L 6 3 L 6 1 L 8 1 L 8 3 L 16 3 L 16 1 L 18 1 L 18 3 L 19 3 C 20.11000061035156 3 21 3.900000095367432 21 5 M 5 7 L 19 7 L 19 5 L 5 5 L 5 7 M 19 19 L 19 9 L 5 9 L 5 19 L 19 19 M 15 13 L 15 11 L 17 11 L 17 13 L 15 13 M 11 13 L 11 11 L 13 11 L 13 13 L 11 13 M 7 15 L 9 15 L 9 17 L 7 17 L 7 15 M 15 17 L 15 15 L 17 15 L 17 17 L 15 17 M 11 17 L 11 15 L 13 15 L 13 17 L 11 17 Z" fill="#2b2f3b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

const String _svg_location =
    '<svg viewBox="23.0 90.0 10.3 14.7" ><path transform="translate(18.0, 88.0)" d="M 10.13476657867432 5.300920963287354 C 11.14757061004639 5.300920963287354 11.96861171722412 6.12196159362793 11.96861171722412 7.134766101837158 C 11.96861171722412 8.14756965637207 11.1475715637207 8.968610763549805 10.13476657867432 8.968610763549805 C 9.121960639953613 8.968610763549805 8.300919532775879 8.14756965637207 8.300920486450195 7.134764671325684 C 8.300921440124512 6.121962070465088 9.121960639953613 5.30092191696167 10.13476467132568 5.300920963287354 M 10.13476657867432 2 C 12.97062015533447 2 15.26953315734863 4.298913955688477 15.26953220367432 7.134766578674316 C 15.26953220367432 10.98583984375 10.13476657867432 16.6707592010498 10.13476657867432 16.6707592010498 C 10.13476657867432 16.6707592010498 5 10.98583984375 5 7.134766101837158 C 5.000000953674316 4.29891300201416 7.298914432525635 1.999999284744263 10.13476753234863 2 M 10.13476657867432 3.467076063156128 C 8.109156608581543 3.467076063156128 6.467075824737549 5.109157085418701 6.467075824737549 7.134766578674316 C 6.467075824737549 7.868303775787354 6.467075824737549 9.335379600524902 10.13476657867432 14.25741863250732 C 13.80245590209961 9.335379600524902 13.80245590209961 7.868303775787354 13.80245590209961 7.134766101837158 C 13.80245590209961 5.109156608581543 12.16037464141846 3.467076063156128 10.13476657867432 3.467076063156128 Z" fill="#00509f" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
