import 'package:flutter/material.dart';

import '../../../helpers/on_boarding_model.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OnBoardingModel(imagePath: 'assets/images/location_on_boarding.png', title: 'Ponto de vacinação e\nconsultas pertinho\nde você!', subTitle: 'Indicamos o estabelecimento de saúde\nmais próximo da sua residência para a sua\nnecessidade referente à sequelas\nda COVID.');
  }
}
