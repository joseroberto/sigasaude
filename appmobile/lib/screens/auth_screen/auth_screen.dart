import 'package:covid_data_app/helpers/search.dart';
import 'package:covid_data_app/screens/auth_screen/google_login.dart';
import 'package:covid_data_app/screens/auth_screen/termo_de_confidencialidade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenMode = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: null,
      body: (screenMode == Orientation.landscape) ? const _LandscapeSceen() : const _PortraitScreen(),
    );
  }
}

class _PortraitScreen extends StatelessWidget {
  const _PortraitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 72.0),
            child: SizedBox(width: 250, height: 250, child: Image.asset('assets/images/siga_saude_logo.png')),
          ),
          SizedBox(width: 180, height: 50, child: Image.asset('assets/images/siga_saude_branding.png')),
          const Spacer(),
          SizedBox(
            width: width * .9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffffffff),
                foregroundColor: const Color(0xff00509f),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: const Text(
                'Cadastrar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Color(0xff00509f),
                  letterSpacing: 0.1612,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: SizedBox(
              width: width * .9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00509f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  side:
                  const BorderSide(width: 1.0, color: Color(0xffffffff)),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xffffffff),
                    letterSpacing: 0.16199999999999998,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _AlternateLoginOption(
                    icon: const SizedBox(
                      width: 28.3,
                      height: 28.3,
                      child: search(),
                    ),
                    onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                _AlternateLoginOption(
                    icon: const Icon(
                      MaterialCommunityIcons.facebook,
                      color: Colors.white,
                    ),
                    onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                _AlternateLoginOption(
                    icon: const Icon(
                      MaterialCommunityIcons.apple,
                      color: Colors.white,
                    ),
                    onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextButton(
              onPressed: (() {
                TermoDeConfidencialidade().showTermoDeConfidencialidade(context);
              }),
              child: Text.rich(
                style: Theme.of(context).textTheme.labelSmall,
                const TextSpan(
                  text: 'Ao cadastrar você estará de acordo com os nossos ',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      color: Color(0xffffffff),
                      height: 1.4,
                      decorationColor: Color(0xffffffff)
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Termos de uso,',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: ' Termo de confidencialidade',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    TextSpan(text: ' e a nossa '),
                    TextSpan(
                      text: 'Política de Privacidade',
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LandscapeSceen extends StatelessWidget {
  const _LandscapeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        width: width,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(width: 250, height: 250, child: Image.asset('assets/images/siga_saude_logo.png')),
            ),
            SizedBox(width: 180, height: 120, child: Image.asset('assets/images/siga_saude_branding.png')),
            SizedBox(
              width: width * .6,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                  foregroundColor: const Color(0xff00509f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'Cadastrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xff00509f),
                    letterSpacing: 0.1612,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: SizedBox(
                width: width * .6,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00509f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    side:
                    const BorderSide(width: 1.0, color: Color(0xffffffff)),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xffffffff),
                      letterSpacing: 0.16199999999999998,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AlternateLoginOption(
                      icon: const SizedBox(
                        width: 28.3,
                        height: 28.3,
                        child: search(),
                      ),
                      onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                  _AlternateLoginOption(
                      icon: const Icon(
                        MaterialCommunityIcons.facebook,
                        color: Colors.white,
                      ),
                      onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                  _AlternateLoginOption(
                      icon: const Icon(
                        MaterialCommunityIcons.apple,
                        color: Colors.white,
                      ),
                      onTap: (() {GoogleLogin().showGoogleLoginDialog(context);})),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: (() {
                  TermoDeConfidencialidade().showTermoDeConfidencialidade(context);
                }),
                child: Text.rich(
                  style: Theme.of(context).textTheme.labelSmall,
                  const TextSpan(
                    text: 'Ao cadastrar você estará de acordo com os nossos ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xffffffff),
                        height: 1.4,
                        decorationColor: Color(0xffffffff)
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Termos de uso,',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: ' Termo de confidencialidade',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: ' e a nossa '),
                      TextSpan(
                        text: 'Política de Privacidade',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class _AlternateLoginOption extends StatelessWidget {
  final Widget icon;
  final Function() onTap;

  const _AlternateLoginOption(
      {Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(80, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          side: const BorderSide(width: 1.0, color: Color(0xffffffff)),
        ),
        onPressed: onTap,
        child: icon);
  }
}
