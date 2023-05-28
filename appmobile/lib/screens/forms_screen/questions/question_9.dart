import 'package:covid_data_app/controller/form_singleton.dart';
import 'package:covid_data_app/helpers/check_box_option.dart';
import 'package:flutter/material.dart';

class Question9 extends StatefulWidget {
  const Question9({Key? key}) : super(key: key);

  @override
  State<Question9> createState() => _Question9State();
}

class _Question9State extends State<Question9> {

  @override
  void initState() {
    FormSingleton().formProvider.validateForm([false]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 24, top: 0),
            child: Text(
              'Apresentou algum destes\napós o período de\ninfeção da covid-19?',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                color: Color(0xff000000),
                letterSpacing: 0.216,
                height: 1.5,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          const CheckBoxOption(option: 'Fadiga - que se caracteriza por\ncansaço extremo e dificuldade em\nrealizar atividades rotineiras'),
          const CheckBoxOption(option: 'Tosse persistente'),
          const CheckBoxOption(option: 'Dificuldade para respirar'),
          const CheckBoxOption(option: 'Perda de olfato ou paladar'),
          const CheckBoxOption(option: 'Dores de cabeça frequentes'),
          const CheckBoxOption(option: 'Transtornos mentais'),
          const CheckBoxOption(option: 'Insônia'),
          const CheckBoxOption(option: 'Ansiedade'),
          const CheckBoxOption(option: 'Tonturas'),
          const CheckBoxOption(option: 'Trombose'),
          const CheckBoxOption(option: 'Taquicardia'),
          const CheckBoxOption(option: 'Outra não citada na lista'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.black,
                letterSpacing: 0.10799999999999998,
                height: 1.5,
              ),
              decoration: const InputDecoration(
                hintText: 'Qual sintoma?',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color.fromRGBO(172, 172, 172, 1),
                  letterSpacing: 0.10799999999999998,
                  height: 1.5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}