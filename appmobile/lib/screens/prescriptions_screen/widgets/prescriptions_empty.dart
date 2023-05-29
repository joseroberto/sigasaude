import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class PrescriptionsEmpty extends StatelessWidget {
  const PrescriptionsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: (screenMode == Orientation.landscape) ? MediaQuery.of(context).size.height * 1.4 : MediaQuery.of(context).size.height * .7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/no_prescriptions.png',
                width: 245,
                height: 220,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75.0, bottom: 42.0),
              child: Text(
                'Você ainda não possui\nnenhuma prescrição',
                textAlign: TextAlign.center,
                style: AppColors.titleTextStyle,
              ),
            ),
            Text(
              'Depois da sua consulta, automaticamente\naparecerá a prescrição médica feita\npelo profissional de saúde',
              style: AppColors.onBoardingSubTitleTextStyle,
              textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            )
          ],
        ),
      ),
    );
  }
}
