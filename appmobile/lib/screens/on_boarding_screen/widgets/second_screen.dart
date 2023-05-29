import 'package:flutter/material.dart';

import '../../../helpers/on_boarding_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingModel(
        imagePath: 'assets/images/msg_on_boarding.png',
        title: 'Informações\nValiosas',
        subTitle: 'Informações direcionais para identificar\npossíveis sequelas da COVID-19'
    );
  }
}