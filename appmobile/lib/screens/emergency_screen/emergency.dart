import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: AppColors.backButton,
        title: Text(
          'Emergência',
          style: AppColors.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: (screenMode == Orientation.landscape) ? MediaQuery.of(context).size.height * 1.4 : MediaQuery.of(context).size.height * .75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/ambulance.png',
                  width: 245,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48.0, bottom: 24.0),
                child: Text(
                  'Parece que você está\nprecisando de ajuda!',
                  textAlign: TextAlign.center,
                  style: AppColors.titleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                child: Text(
                  'Clique abaixo\npara ligar ou visualizar a\nunidade mais próxima',
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
                      text: 'UPA II',
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(218, 0, 0, 1),
              foregroundColor: const Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            child: const Text(
              'Ligar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0xffffffff),
                letterSpacing: 0.1612,
                fontWeight: FontWeight.w500,
                height: 1,
              ),
              textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
