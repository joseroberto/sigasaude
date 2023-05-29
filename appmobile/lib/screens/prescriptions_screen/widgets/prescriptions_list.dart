import 'package:covid_data_app/screens/prescriptions_screen/widgets/prescription_opened.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PrescriptionsList extends StatelessWidget {
  const PrescriptionsList({Key? key}) : super(key: key);

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
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: EdgeInsets.all(12),
              leading: SizedBox(
                width: 30,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(MaterialCommunityIcons.stethoscope),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '00/00/2023 às 14:30h',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 125, 248, 1),
                  ),
                ),
              ),
              subtitle: Text(
                'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
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
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: EdgeInsets.all(12),
              leading: SizedBox(
                width: 30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(MaterialCommunityIcons.stethoscope),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '00/00/2023 às 09:00h',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 125, 248, 1),
                  ),
                ),
              ),
              subtitle: Text(
                'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
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
              tileColor: Colors.white,
              horizontalTitleGap: 24,
              contentPadding: const EdgeInsets.all(12),
              leading: const SizedBox(
                width: 30,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(MaterialCommunityIcons.stethoscope),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('00/00/2023 às 10:30h',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 125, 248, 1),
                  ),
                ),
              ),
              subtitle: const Text(
                  'UBS -DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
