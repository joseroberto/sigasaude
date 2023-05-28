import 'package:flutter/material.dart';

import '../../main.dart';
import '../../themes/app_colors.dart';

class TermoDeConfidencialidade {
  void showTermoDeConfidencialidade(BuildContext context) {
    const String termo =
        '\n\nTodos os usuários ao realizar o acesso ao aplicativo deverão ser informados, que ao inserir os dados no aplicativo, as informações seguirão as regras estabelecidas na legislação vigente observando a Política Nacional de Informação e Informática do SUS (PNIIS/SUS)3, a Lei de Acesso à Informação (LAI)4 e a Lei Geral de Proteção de Dados (LGPD)5.  '
        '\n\nE que estão de acordo que as informações inseridas serão disponibilizadas ao gestor do estabelecimento de saúde vinculado a sua área de residência a partir do CEP informado com o objetivo de oferecer o acesso necessário aos serviços de saúde ofertados pelo estabelecimento de saúde. Todos os usuários ao realizar o acesso ao aplicativo deverão ser informados, que ao inserir os dados no aplicativo, as informações seguirão as regras estabelecidas na legislação vigente observando a Política Nacional de Informação e Informática do SUS (PNIIS/SUS)3, a Lei de Acesso à Informação (LAI)4 e a Lei Geral de Proteção de Dados (LGPD)5.  '
        '\n\nE que estão de acordo que as informações inseridas serão disponibilizadas ao gestor do estabelecimento de saúde vinculado a sua área de residência a partir do CEP informado com o objetivo de oferecer o acesso necessário aos serviços de saúde ofertados pelo estabelecimento de saúde. Todos os usuários ao realizar o acesso ao aplicativo deverão ser informados, que ao inserir os dados no aplicativo, as informações seguirão as regras estabelecidas na legislação vigente observando a Política Nacional de Informação e Informática do SUS (PNIIS/SUS)3, a Lei de Acesso à Informação (LAI)4 e a Lei Geral de Proteção de Dados (LGPD)5.  ';

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            toolbarHeight: 80,
            leadingWidth: 70,
            automaticallyImplyLeading: false,
            leading: Align(alignment: Alignment.bottomCenter, child: AppColors.backButton),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 32.0),
                child: IconButton(
                  style: IconButton.styleFrom(
                    fixedSize: const Size(25, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    side: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(196, 197, 198, 1)),
                  ),
                  onPressed: () {
                    Navigator.pop(navigatorKey!.currentContext!);
                  },
                  icon: const Icon(Icons.close),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .87,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                        child: Text(
                          'Termo de\nConfidencialidade',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            color: Color(0xff000000),
                            letterSpacing: 0.21599999999999997,
                            height: 1.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Text(
                          termo,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            color: Color(0xff999999),
                            letterSpacing: 0.09,
                            height: 1.4,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00509f),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          elevation: 8,
                        ),
                        child: const SizedBox(
                          width: 90.0,
                          height: 25.0,
                          child: Text(
                            'Continuar',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              color: Color(0xffffffff),
                              letterSpacing: -0.18,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
