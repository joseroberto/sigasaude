import 'package:flutter/material.dart';

import '../../../helpers/on_boarding_model.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingModel(imagePath: 'assets/images/calendar_on_boarding.png', title: 'Agendamento de\nconsultas', subTitle: 'Você pode agendar consultas\nde acordo com sua necessidade!');
  }
}
