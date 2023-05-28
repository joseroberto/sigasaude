import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  HomeBottomNavigationBarState createState() => HomeBottomNavigationBarState();
}

class HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(MaterialCommunityIcons.home, 'Inicio', 0),
          buildIconButton(AntDesign.calendar, 'Agendar', 1),
          buildIconButton(
              MaterialCommunityIcons.notebook_check, 'Prescrições', 2),
          buildIconButton(MaterialCommunityIcons.ambulance, 'Emergência', 3),
        ],
      ),
    );
  }

  Widget buildIconButton(IconData icon, String description, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
              if(selectedIndex == 2) {
                Navigator.pushNamed(context, 'prescriptions');
                setState(() {selectedIndex = 0;});
              }else if(selectedIndex == 1) {
                Navigator.pushNamed(context, 'agendar_consulta');
                setState(() {selectedIndex = 0;});
              }else if(selectedIndex == 3) {
                Navigator.pushNamed(context, 'locations');
                setState(() {selectedIndex = 0;});
              }
            },
            icon: Icon(
              icon,
              size: selectedIndex == index ? 26 : 24,
              color: selectedIndex == index
                  ? const Color(0xffffffff)
                  : const Color(0x75ffffff),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: selectedIndex == index ? 12 : 10,
              color: const Color(0xffffffff),
              letterSpacing: 0.09,
              height: 1.8,
            ),
            textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ],
      ),
    );
  }
}