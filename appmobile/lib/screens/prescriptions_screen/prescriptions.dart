import 'package:flutter/material.dart';

import '../../main.dart';
import '../../themes/app_colors.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({Key? key}) : super(key: key);

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
          'Suas Prescrições',
          style: AppColors.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              style: IconButton.styleFrom(
                fixedSize: const Size(25, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                side: const BorderSide(
                    width: 1, color: Color.fromRGBO(196, 197, 198, 1)),
              ),
              onPressed: () {
                Navigator.pop(navigatorKey!.currentContext!);
              },
              icon: Image.asset('assets/images/icon_list.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 16.0, right: 16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00509f),
              foregroundColor: const Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            child: const Text(
              'OK',
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