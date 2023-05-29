import 'package:covid_data_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class OpenedPrescription extends StatelessWidget {
  const OpenedPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: AppColors.backButton,
        title: const Text('Suas Prescrições', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    fixedSize: const Size(25, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    side: const BorderSide(
                        width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.download),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    fixedSize: const Size(25, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    side: const BorderSide(
                        width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                  icon: const Icon(Icons.share),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(MaterialCommunityIcons.calendar_heart),
                      ),
                      Text(
                        '08/05/2023 - 10:30h',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(MaterialCommunityIcons.stethoscope),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dr. Netto Curvo',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Text(
                                'CRM 000000000000',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(MaterialCommunityIcons.hospital_building),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UPA II - Lourem Ipsum',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          'DF-075, Km 180, Área Especial, EPNB\nBrasília - DF, 71705-510',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 8,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(4.0, 40.0, 0, 8),
                child: Text(
                  'Prescrição Médica',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 125, 248, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'
                  ),
                ),
              ),
              const _PrescriptionItem(
                title: 'Remdesivir',
                icon: MaterialCommunityIcons.pill,
                use: '1 por dia',
                qtdDays: '10 dias',
              ),
              const _PrescriptionItem(
                  title: 'Dexametasona',
                  icon: MaterialCommunityIcons.pill,
                  use: '1 por dia',
                  qtdDays: '10 dias'),
              const _PrescriptionItem(
                  title: 'Casirivimabe/imdevimabe',
                  icon: MaterialCommunityIcons.pill,
                  use: '1 por dia',
                  qtdDays: '10 dias'),
              const _PrescriptionItem(
                  title: 'Fisioterapia Pulmonar',
                  icon: MaterialCommunityIcons.pulse,
                  use: '2 por semana',
                  qtdDays: '60 dias'),
              Padding(
                padding: const EdgeInsets.only(top: 88.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/doctor_signature.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PrescriptionItem extends StatelessWidget {
  final String title;
  final String use;
  final String qtdDays;
  final IconData icon;

  const _PrescriptionItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.use,
      required this.qtdDays})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(icon),
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 125, 248, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          'Uso:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                      Text(
                        'Quant. de dias:',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            use,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Text(
                          qtdDays,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
