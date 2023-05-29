import 'package:covid_data_app/consultas_list.dart';
import 'package:covid_data_app/controller/maps_singleton.dart';
import 'package:covid_data_app/locations_list.dart';
import 'package:covid_data_app/screens/home_screen/widgets/home_app_bar.dart';
import 'package:covid_data_app/screens/home_screen/widgets/home_bottom_navigation_bar.dart';
import 'package:covid_data_app/screens/home_screen/widgets/sintomas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../themes/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    MapsSingleton().mapProvider.setCustomMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(249, 249, 249, 1),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 25,
                      color: Color(0xff2c3e50),
                      letterSpacing: -0.25,
                      height: 1.32,
                    ),
                    children: [
                      TextSpan(
                        text: 'Olá, Klivisson',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '! ',
                      ),
                    ],
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
              const _SearchBar(),
              const _SymptomsCard(),
              SizedBox(
                width: width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Suas informações',
                        style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 18,
                          color: Color(0xff2c3e50),
                          letterSpacing: -0.18,
                          fontWeight: FontWeight.w700,
                          height: 1.3333333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: const Text(
                        'ver mais',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xff007df8),
                          decorationColor: Color(0xff007df8),
                          letterSpacing: 0.10799999999999998,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          height: 2,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: _InfoGrid(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 60,
        width: width * .9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    hintText: '  O que você quer pesquisar?'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.mic,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SymptomsCard extends StatelessWidget {
  const _SymptomsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return (screenMode == Orientation.landscape)
        ? _landscapeCard(context)
        : _portraitCard(context);
  }

  Widget _portraitCard(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SintomasScreen();
          }));
        }),
        child: Stack(
          children: [
            Container(
              width: width,
              height: 160,
              color: const Color.fromRGBO(249, 249, 249, 1),
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: width * .9,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Positioned(
                top: 50,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quais sintomas\nainda persistem?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Clique para nos informar',
                        style: TextStyle(
                            color: Colors.white60,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white60),
                      ),
                    )
                  ],
                )),
            Image.asset(
              'assets/images/doctor.png',
              width: 150,
              height: 170,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _landscapeCard(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SintomasScreen();
          }));
        }),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned(
              bottom: 10,
              child: Container(
                width: width * .7,
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Image.asset(
              'assets/images/doctor.png',
              width: 170,
              height: 170,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: width * .7,
              height: 120,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quais sintomas\nainda persistem?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 12),
                    child: Text(
                      'Clique para nos informar',
                      style: TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white60),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoGrid extends StatefulWidget {
  const _InfoGrid({Key? key}) : super(key: key);

  @override
  State<_InfoGrid> createState() => _InfoGridState();
}

class _InfoGridState extends State<_InfoGrid> {
  String qtdAppointments = '';
  String qtdLocations = '';

  @override
  void initState() {
    if(consultasList.isEmpty) {
      qtdAppointments = 'Você ainda não tem\nnenhuma consulta marcada';
    } else {
      qtdAppointments = 'Você tem ${consultasList.where((element) => element["title"] == 'marked').length} consulta(s)\nmarcada(s)';
    }

    if(locationsList.isEmpty) {
      qtdLocations = 'Não há nenhum estabelimento próximo';
    }else {
      qtdLocations = '${locationsList.length} estabelecimentos';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      _InfoCard(
          icon: MaterialCommunityIcons.calendar_heart,
          title: 'Suas Consultas',
          subTitle: qtdAppointments,
          function: (() {Navigator.pushNamed(context, 'appointments');})),
      _InfoCard(
          icon: MaterialCommunityIcons.needle,
          title: 'Cartilha de vacina\nCOVID-19',
          subTitle: '*Está na hora de tomar\n PFIZER Bivalente',
          function: (() {Navigator.pushNamed(context, 'vaccines');})),
      _InfoCard(
          icon: MaterialCommunityIcons.hospital_building,
          title: 'Estabelecimentos\npróximo a voce',
          subTitle: qtdLocations,
          function: (() {
            Navigator.pushNamed(context, 'locations');
          })),
      _InfoCard(
          icon: MaterialCommunityIcons.newspaper,
          title: 'Artigos para você\nler',
          subTitle: '10 artigos',
          function: (() {Navigator.pushNamed(context, 'articles');})),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          mainAxisExtent: 170),
      itemCount: 4,
      itemBuilder: ((BuildContext context, int index) {
        return cards[index];
      }),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Function() function;

  const _InfoCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  border: Border.all(
                    color: const Color.fromRGBO(177, 177, 177, 1),
                    width: 1,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 14,
                  color: Color(0xff2c3e50),
                  letterSpacing: -0.14,
                  fontWeight: FontWeight.w700,
                  height: 1.2857142857142858,
                ),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
              Text(
                subTitle,
                style: (subTitle.contains('PFIZER'))
                    ? const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 10,
                        color: Color(0xffe74e00),
                        letterSpacing: -0.1,
                        height: 1.2,
                      )
                    : const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 10,
                        color: Color(0xff2c3e50),
                        letterSpacing: -0.1,
                        height: 1.2,
                      ),
                overflow: TextOverflow.clip,
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
