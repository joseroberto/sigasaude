import 'package:flutter/material.dart';

import '../../main.dart';
import '../../themes/app_colors.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 80,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: AppColors.backButton,
        title: Text(
          'Artigos para você ler',
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
          height: (screenMode == Orientation.landscape) ? MediaQuery.of(context).size.height * 1.5 : MediaQuery.of(context).size.height * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/no_articles.png',
                  width: 322,
                  height: 240,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 72.0, bottom: 42.0),
                child: Text(
                  'Ainda não há nenhum\nartigo para leitura',
                  textAlign: TextAlign.center,
                  style: AppColors.titleTextStyle,
                ),
              ),
              Text(
                'Em breve serão adicionados artigos\ncom informações valiosas\npara você',
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
    );
  }
}
