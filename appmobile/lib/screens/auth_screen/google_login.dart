import 'package:flutter/material.dart';

class GoogleLogin {
  void showGoogleLoginDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            iconPadding: const EdgeInsets.all(0),
            icon: Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: (() {Navigator.pop(context);}), icon: const Icon(Icons.close)),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google_logo.png',
                    width: 150,
                    height: 80,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Escolha uma conta',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 19,
                          color: Color(0xff000000),
                          letterSpacing: 0.17099999999999999,
                          height: 1.5263157894736843,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: Color(0xff000000),
                            letterSpacing: 0.1,
                            height: 1.81,
                          ),
                          children: [
                            TextSpan(
                              text: 'para continuar no ',
                            ),
                            TextSpan(
                              text: 'SIGA SAÚDE',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  )
                ],
              ),
            ),
            content: const _AccountItems(),
          );
        });
  }
}

class _AccountItems extends StatelessWidget {
  const _AccountItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          _ItemTile(color: Colors.blue),
          Divider(),
          _ItemTile(color: Colors.red),
          Divider(),
          _ItemTile(color: Colors.orange),
          Divider(),
          _ItemTile(color: Colors.green),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 40,
                    height: 35,
                    child: Icon(Icons.person_add_alt_1_outlined)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Adicionar outra conta',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xff2b2f3b),
                          letterSpacing: 0.126,
                          height: 1.7142857142857142,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Divider(),
          ),
          _GoogleText()
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  final Color color;

  const _ItemTile({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 35;
    double height = 35;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lourem Ipsum',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff2b2f3b),
                    letterSpacing: 0.126,
                    height: 1.7142857142857142,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  'louremipsum@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Color(0xc22b2f3b),
                    letterSpacing: 0.09,
                    height: 2.4,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _GoogleText extends StatelessWidget {
  const _GoogleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Color(0xff000000),
          letterSpacing: 0.09,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text:
                'Para continuar, o Google compartilhará seu nome, seu \nendereço de e-mail e sua foto do perfil com o app ',
          ),
          TextSpan(
            text: '...',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '. \nAntes de usar esse app, revise a ',
          ),
          TextSpan(
            text: 'politica de privacidade',
            style: TextStyle(
              color: Color(0xff0088ff),
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: ' e\nos ',
          ),
          TextSpan(
            text: 'termos de serviço ',
            style: TextStyle(
              color: Color(0xff0088ff),
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: 'dele.',
          ),
        ],
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      softWrap: false,
    );
  }
}
