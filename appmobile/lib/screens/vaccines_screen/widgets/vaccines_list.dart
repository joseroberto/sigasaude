import 'package:covid_data_app/screens/prescriptions_screen/widgets/prescription_opened.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class VaccinesList extends StatelessWidget {
  const VaccinesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            shadowColor: Colors.black,
            child: ListTile(
              isThreeLine: true,
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: EdgeInsets.all(8),
              leading: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 10.0),
                      child: SizedBox(
                        width: 50,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Icon(MaterialCommunityIcons.needle, size: 20,),
                        ),
                      ),
                    ),
                    Text(
                      'DOSE',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    Text(
                      '01',
                      style: TextStyle(
                          fontSize: 24, color: Color.fromRGBO(0, 125, 248, 1)),
                    )
                  ],
                ),
              ),
              title: Text(
                'Aplicada em 00/00/2021',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 125, 248, 1),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    TextSpan(text: 'AstraZeneca - ', children: <TextSpan>[
                      TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        text: 'Oxford'),
                    ]),
                  ),
                  Text(
                    'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              isThreeLine: true,
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: EdgeInsets.all(12),
              leading: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 8.0),
                      child: SizedBox(
                        width: 50,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Icon(MaterialCommunityIcons.needle, size: 20,),
                        ),
                      ),
                    ),
                    Text(
                      'DOSE',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    Text(
                      '02',
                      style: TextStyle(
                          fontSize: 24, color: Color.fromRGBO(0, 125, 248, 1)),
                    )
                  ],
                ),
              ),
              title: Text(
                'Aplicada em 00/00/2021',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 125, 248, 1),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                    TextSpan(text: 'AstraZeneca - ', children: <TextSpan>[
                      TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          text: 'Oxford'),
                    ]),
                  ),
                  Text(
                    'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              isThreeLine: true,
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: EdgeInsets.all(12),
              leading: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 8.0),
                      child: SizedBox(
                        width: 50,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Icon(MaterialCommunityIcons.needle, size: 20,),
                        ),
                      ),
                    ),
                    Text(
                      'DOSE',
                      style: TextStyle(fontSize: 9, color: Colors.grey),
                    ),
                    Text(
                      '03',
                      style: TextStyle(
                          fontSize: 24, color: Color.fromRGBO(0, 125, 248, 1)),
                    )
                  ],
                ),
              ),
              title: Text(
                'Aplicada em 00/00/2022',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 125, 248, 1),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                    TextSpan(text: 'AstraZeneca - ', children: <TextSpan>[
                      TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          text: 'Oxford'),
                    ]),
                  ),
                  Text(
                    'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              onTap: (() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const OpenedPrescription();
                }));
              }),
              tileColor: const Color.fromRGBO(0, 125, 248, 1),
              horizontalTitleGap: 24,
              contentPadding: const EdgeInsets.all(12),
              leading: const SizedBox(
                width: 50,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Icon(MaterialCommunityIcons.needle, size: 28, color: Colors.white,),
                ),
              ),
              title: const Text.rich(
                TextSpan(text: 'Está na hora de tomar a\n',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.white,
                ),
                  children: <TextSpan> [
                    TextSpan(
                      text: 'PFIZER BIVALENTE\n',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Compareça a unidade mais próxima para a\nvacinação!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
