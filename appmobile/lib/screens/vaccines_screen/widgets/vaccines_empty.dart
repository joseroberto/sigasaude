import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class VaccinesEmpty extends StatelessWidget {
  const VaccinesEmpty({Key? key}) : super(key: key);

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
                'assets/images/no_vaccines.png',
                width: 245,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0, bottom: 24.0),
              child: Text(
                'Você não tomou\nnenhuma dose!',
                textAlign: TextAlign.center,
                style: AppColors.titleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Vá até o estabelecimento regularizar\na vacina para COVID',
                style: AppColors.onBoardingSubTitleTextStyle,
                textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(237, 240, 242, 1),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: const Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2c3e50),
                      letterSpacing: 0.128,
                      height: 1.1666666666666667,
                    ),
                    text: 'UBS',
                    children: [
                      TextSpan(
                        text:
                        ' - DF-075, Km 180, Área Especial\nEPNB Brasília - DF, 71705-510',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.096,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
