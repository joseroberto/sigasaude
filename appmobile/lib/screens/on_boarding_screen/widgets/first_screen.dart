import 'package:covid_data_app/helpers/on_boarding_model.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingModel(imagePath: 'assets/images/cwok_casual_on_boarding.png', title: 'Navegue como\nse tivesse nas nuvens!', subTitle: 'Seja bem-vindo ao\nSIGA SAÚDE');
  }
}
